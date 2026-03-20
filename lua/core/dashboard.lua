local RECENT_FILES_COUNT = 10

vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    if vim.fn.argc() == 0 and vim.fn.expand '%' == '' then
      local buf = vim.api.nvim_create_buf(false, true)
      vim.api.nvim_set_current_buf(buf)

      vim.bo[buf].buftype = 'nofile'

      local cwd = vim.fn.getcwd()
      local recent = {}

      for _, file in ipairs(vim.v.oldfiles) do
        if vim.startswith(file, cwd) and vim.fn.filereadable(file) == 1 then
          local relative = vim.fn.fnamemodify(file, ':~:.')
          if not relative:match '^%.git/' then
            table.insert(recent, file)
            if #recent == RECENT_FILES_COUNT then break end
          end
        end
      end

      local lines = {}

      for _, file in ipairs(recent) do
        table.insert(lines, vim.fn.fnamemodify(file, ':t'))
      end

      vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
      vim.bo[buf].modifiable = false

      vim.keymap.set('n', '<CR>', function()
        local line = vim.api.nvim_win_get_cursor(0)[1]
        if line <= #recent then vim.cmd('edit ' .. vim.fn.fnameescape(recent[line])) end
      end, { buffer = buf })
    end
  end,
})
