vim.opt.nu = true
vim.opt.relativenumber = true
vim.o.mouse = 'a'

-- Highlight the current line
vim.opt.cursorline = true

-- Global status line
vim.o.laststatus = 3

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false

-- Search settings
vim.o.ignorecase = true  -- Ignore case when searching
vim.o.smartcase = true   -- Override ignorecase if search contains uppercase letters
vim.opt.hlsearch = true  -- Highlight search results
vim.opt.incsearch = true -- Show search results as you type

vim.opt.termguicolors = true

vim.opt.shortmess:append "sI"

vim.opt.scrolloff = 12

vim.opt.signcolumn = "yes" -- For things like git signs, diagnostics, breakpoints, etc.

vim.opt.isfname:append("@-@")

vim.opt.clipboard:append("unnamedplus")

vim.opt.fillchars:append { eob = " " }

vim.opt.termguicolors = true

vim.opt.updatetime = 200 -- Enable file system watcher

vim.opt.autoread = true  -- Auto-reload files when changed externally

-- Folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldcolumn = "0"
vim.opt.foldtext = ""
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldnestmax = 4
vim.opt.fillchars:append({
    fold = " ", -- Clean fold fill character
})

-- Trigger checktime more frequently
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
    pattern = "*",
    command = "if mode() != 'c' | checktime | endif",
})

vim.diagnostic.config({
    virtual_text = { severity = vim.diagnostic.severity.ERROR },
    -- virtual_text = false,
    update_in_insert = true,
    float = { source = "always", border = "rounded" },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.HINT] = "󰠠",
        },
    },
})
