vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Custom scripts
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Quickfix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- Clear highlights for search
vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<cr>")

-- Move lines
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv")
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==')
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==')

-- Scroll & center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Substitute
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set('v', '<leader>s', '"hy:%s/<C-r>h/<C-r>h/g<Left><Left>')

-- Copy, Cut, Paste, Select
vim.keymap.set({ "x" }, "p", '"_dP')
vim.keymap.set({ "n", "v" }, '<leader>y', '"+y')

-- Indentation
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('n', '>', '>>')
vim.keymap.set('n', '<', '<<')

-- Buffers
vim.keymap.set("n", "<C-a>", "gg<S-v>G")
vim.keymap.set('n', '<Tab>', '<C-6>')
vim.keymap.set("n", "<C-c>", "<cmd>%y+<CR>")
