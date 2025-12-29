vim.opt.relativenumber = true
vim.opt.nu = true

vim.o.mouse = 'a'

-- Highlight the current line
vim.opt.cursorline = true

-- Neovim bottm line
vim.o.laststatus = 3

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- vim.opt.colorcolumn = "120"

vim.opt.wrap = false     -- Line wrapping
vim.opt.swapfile = false -- .swp files creation
vim.opt.backup = false   -- Disable backup files

-- Search settings
vim.o.ignorecase = true       -- Ignore case when searching
vim.o.smartcase = true        -- Override ignorecase if search contains uppercase letters
vim.opt.hlsearch = true       -- Highlight search results
vim.opt.incsearch = true      -- Show search results as you type

vim.opt.scrolloff = 12        -- Keep 12 lines visible above/below the cursor

vim.opt.isfname:append("@-@") -- Allow '@' in filenames

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
vim.schedule(function()
    vim.o.clipboard = 'unnamedplus'
end)

vim.opt.termguicolors = true -- Enable 24-bit RGB color in the TUI

-- Activate sign column from the start for things like diagnostics, gitsigns, etc.
vim.opt.signcolumn = "yes"

-- Folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldcolumn = "0"
vim.opt.foldtext = ""
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
-- vim.opt.fillchars:append({ fold = " " }) -- Clean fold fill character

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
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
