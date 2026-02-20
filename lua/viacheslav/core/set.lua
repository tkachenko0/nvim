vim.opt.relativenumber = true
vim.opt.nu = true

-- Highlight the current line
vim.opt.cursorline = true

-- Neovim bottm line
vim.o.laststatus = 3

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false     -- Line wrapping
vim.opt.swapfile = false -- .swp files creation
vim.opt.backup = false   -- Disable backup files

-- Search settings
vim.o.ignorecase = true  -- Ignore case when searching
vim.o.smartcase = true   -- Override ignorecase if search contains uppercase letters
vim.opt.hlsearch = true  -- Highlight search results
vim.opt.incsearch = true -- Show search results as you type

vim.opt.scrolloff = 12   -- Keep 12 lines visible above/below the cursor

-- Sync clipboard between OS and Neovim.
vim.o.clipboard = 'unnamedplus'

vim.opt.termguicolors = true -- Enable 24-bit RGB color in the TUI

-- Activate sign column from the start for things like diagnostics, gitsigns, etc.
vim.opt.signcolumn = "yes"

-- Folding
vim.opt.foldcolumn = "0"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldmethod = "indent"

-- Confirm before closing with unsaved changes
vim.o.confirm = true

-- Auto-reload files when changed externally
vim.opt.autoread = true
vim.opt.updatetime = 50
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
    pattern = "*",
    command = "if mode() != 'c' | checktime | endif",
})

vim.diagnostic.config({
    update_in_insert = true,
    float = {
        source = "always",
        border = "rounded"
    },
})

vim.api.nvim_create_user_command('Kiro', function(opts)
    local question = opts.args
    vim.cmd('split | terminal kiro-cli chat "' .. question .. '"')
end, { nargs = 1 })

vim.api.nvim_create_user_command('KiroSelection', function()
    local start_pos = vim.fn.getpos("'<")
    local end_pos = vim.fn.getpos("'>")
    local lines = vim.fn.getline(start_pos[2], end_pos[2])

    if #lines == 1 then
        lines[1] = string.sub(lines[1], start_pos[3], end_pos[3])
    else
        lines[1] = string.sub(lines[1], start_pos[3])
        lines[#lines] = string.sub(lines[#lines], 1, end_pos[3])
    end

    local text = table.concat(lines, '\n'):gsub('"', '\\"')
    vim.cmd('split | terminal kiro-cli chat "' .. text .. '"')
end, { range = true })
