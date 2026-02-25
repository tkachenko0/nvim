vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.cursorline = true
vim.o.laststatus = 3
vim.opt.signcolumn = 'yes'
vim.o.confirm = true
vim.opt.scrolloff = 8
vim.opt.termguicolors = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.o.ignorecase = true
vim.o.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.foldcolumn = '0'
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldmethod = 'indent'

vim.opt.autoread = true
vim.opt.updatetime = 50
vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI' }, {
  pattern = '*',
  command = "if mode() != 'c' | checktime | endif",
})

vim.diagnostic.config {
  update_in_insert = true,
  severity_sort = true,
  float = {
    source = 'always',
    border = 'rounded',
  },
}
