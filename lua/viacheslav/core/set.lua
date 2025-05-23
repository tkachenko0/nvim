vim.opt.nu = true
vim.opt.relativenumber = true
vim.o.mouse = 'a' -- Enable mouse mode (default: '')
vim.opt.cursorline = true

vim.opt.tabstop = 4        -- A tab character is displayed as 4 spaces wide
vim.opt.softtabstop = 4    -- When you hit <Tab> in insert mode, it inserts 4 spaces
vim.opt.shiftwidth = 4     -- When indenting with << or >>, it moves by 4 spaces
vim.opt.expandtab = true   -- Use spaces instead of actual tab characters
vim.opt.smartindent = true -- Auto-indents new lines smartly based on syntax

vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
-- vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 15
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- clipboard
vim.opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- end of buffer characters
vim.opt.fillchars:append { eob = " " }

vim.diagnostic.config({
    virtual_text = { severity = vim.diagnostic.severity.ERROR },
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
