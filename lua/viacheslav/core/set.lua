vim.opt.nu = true
vim.opt.relativenumber = true
vim.o.mouse = 'a'

-- Highlight the current line
vim.opt.cursorline = true
-- vim.opt.cursorlineopt = "number" -- only highlight the line number

-- Global status line
vim.o.laststatus = 3

vim.opt.tabstop = 4        -- A tab character is displayed as 4 spaces wide
vim.opt.softtabstop = 4    -- When you hit <Tab> in insert mode, it inserts 4 spaces
vim.opt.shiftwidth = 4     -- When indenting with << or >>, it moves by 4 spaces
vim.opt.expandtab = true   -- Use spaces instead of actual tab characters
vim.opt.smartindent = true -- Auto-indents new lines smartly based on syntax

vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false

-- Search settings
vim.o.ignorecase = true  -- Ignore case when searching
vim.opt.hlsearch = true  -- Highlight search results
vim.opt.incsearch = true -- Show search results as you type

vim.opt.termguicolors = true

vim.opt.shortmess:append "sI"

vim.opt.scrolloff = 15

-- For things like git signs, diagnostics, breakpoints, etc.
vim.opt.signcolumn = "yes"

vim.opt.isfname:append("@-@")

vim.opt.clipboard:append("unnamedplus")

vim.opt.fillchars:append { eob = " " }

vim.opt.termguicolors = true

-- Enable file system watcher
vim.opt.updatetime = 200

-- Auto-reload files when changed externally
vim.opt.autoread = true

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
