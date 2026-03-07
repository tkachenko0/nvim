vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local set = vim.keymap.set

-- set("n", "<C-j>", "<c-w><c-j>")
-- set("n", "<C-k>", "<c-w><c-k>")
-- set("n", "<C-l>", "<c-w><c-l>")
-- set("n", "<C-h>", "<c-w><c-h>")

set('n', '<C-k>', '<cmd>cnext<CR>zz')
set('n', '<C-j>', '<cmd>cprev<CR>zz')

set('v', '<A-j>', ":m '>+1<CR>gv=gv")
set('v', '<A-k>', ":m '<-2<CR>gv=gv")
set('n', '<A-j>', ':m .+1<CR>==')
set('n', '<A-k>', ':m .-2<CR>==')

set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
set('v', '<leader>s', '"hy:%s/<C-r>h/<C-r>h/g<Left><Left>')

set('x', 'p', '"_dP')
set({ 'n', 'v' }, '<leader>p', '"+P')
set({ 'n', 'v' }, 'y', '"+y')
set({ 'n', 'v' }, '<leader>c', '"+c')

set('v', '<', '<gv')
set('v', '>', '>gv')
set('n', '>', '>>')
set('n', '<', '<<')

set('n', '<Tab>', '<C-6>')
set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')
