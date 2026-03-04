vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')

vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz')

vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set('v', '<leader>s', '"hy:%s/<C-r>h/<C-r>h/g<Left><Left>')

vim.keymap.set('x', 'p', '"_dP')
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"+P')
vim.keymap.set({ 'n', 'v' }, 'y', '"+y')
vim.keymap.set({ 'n', 'v' }, '<leader>c', '"+c')

vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('n', '>', '>>')
vim.keymap.set('n', '<', '<<')

vim.keymap.set('n', '<Tab>', '<C-6>')
