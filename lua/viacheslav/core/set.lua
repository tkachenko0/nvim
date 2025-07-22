vim.opt.relativenumber = true
vim.opt.nu = true

vim.o.mouse = 'a'

-- Highlight the current line
vim.opt.cursorline = true

-- Neovim bottm line
vim.o.laststatus = 0

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false     -- Line wrapping
vim.opt.swapfile = false -- .swp files creation
vim.opt.backup = false   -- Disable backup files

-- Search settings
vim.o.ignorecase = true                 -- Ignore case when searching
vim.o.smartcase = true                  -- Override ignorecase if search contains uppercase letters
vim.opt.hlsearch = true                 -- Highlight search results
vim.opt.incsearch = true                -- Show search results as you type

vim.opt.scrolloff = 12                  -- Keep 12 lines visible above/below the cursor

vim.opt.isfname:append("@-@")           -- Allow '@' in filenames

vim.opt.clipboard:append("unnamedplus") -- Use the system clipboard for all yanks

vim.opt.fillchars:append({ eob = " " }) -- Eliminate the end-of-buffer characters

vim.opt.termguicolors = true            -- Enable 24-bit RGB color in the TUI

vim.opt.signcolumn =
"yes"                                   -- Activate sign column from the start for things like diagnostics, gitsigns, etc.

-- Folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldcolumn = "0"
vim.opt.foldtext = ""
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.fillchars:append({ fold = " " }) -- Clean fold fill character

-- Auto-reload files when changed externally
vim.opt.autoread = true
vim.opt.updatetime = 50
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
    pattern = "*",
    command = "if mode() != 'c' | checktime | endif",
})

vim.diagnostic.config({
    -- virtual_text = {
    --     severity = vim.diagnostic.severity.ERROR
    -- },
    update_in_insert = true,
    float = {
        source = "always",
        border = "rounded"
    },
})
