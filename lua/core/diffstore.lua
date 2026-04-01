local store = {}
local data_path = vim.fn.stdpath 'data' .. '/diffstore-nvim-entries.json'

local function load_store()
  local f = io.open(data_path, 'r')
  if not f then return end
  local content = f:read '*a'
  f:close()
  store = vim.json.decode(content) or {}
end

local function save_store()
  local f = io.open(data_path, 'w')
  if not f then return end
  f:write(vim.json.encode(store))
  f:close()
end

local function open_menu()
  load_store()

  local cwd = vim.fn.system('git rev-parse --show-toplevel'):gsub('%s+$', '')
  local entries = store[cwd] or {}

  local buf = vim.api.nvim_create_buf(false, true)
  local lines = #entries > 0 and entries or { '' }

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.api.nvim_buf_set_name(buf, 'diffstore')
  vim.bo[buf].buftype = 'acwrite'
  vim.bo[buf].filetype = 'diffstore'

  local width = math.floor(vim.o.columns * 0.6)
  local height = math.min(#lines + 2, 15)
  local win = vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    col = math.floor((vim.o.columns - width) / 2),
    row = math.floor((vim.o.lines - height) / 2),
    style = 'minimal',
    border = 'single',
    title = ' DiffStore ',
    title_pos = 'center',
  })

  vim.keymap.set('n', '<CR>', function()
    local line = vim.api.nvim_get_current_line()
    vim.api.nvim_win_close(win, true)
    if line ~= '' then
      vim.cmd('DiffviewClose')
      vim.cmd('DiffviewOpen ' .. line)
    end
  end, { buffer = buf })

  vim.keymap.set('n', 'q', function()
    vim.api.nvim_win_close(win, true)
  end, { buffer = buf })

  vim.keymap.set('n', '<Esc>', function()
    vim.api.nvim_win_close(win, true)
  end, { buffer = buf })

  local function save_buf()
    local new_lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
    local filtered = vim.tbl_filter(function(l) return l ~= '' end, new_lines)
    store[cwd] = #filtered > 0 and filtered or nil
    save_store()
    vim.bo[buf].modified = false
  end

  vim.api.nvim_create_autocmd('BufWriteCmd', { buffer = buf, callback = save_buf })

  vim.api.nvim_create_autocmd('WinClosed', {
    buffer = buf,
    callback = function()
      save_buf()
      vim.api.nvim_buf_delete(buf, { force = true })
    end,
  })
end

vim.api.nvim_create_user_command('DiffStore', open_menu, {})
