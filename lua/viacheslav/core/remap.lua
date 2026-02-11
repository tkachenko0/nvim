vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Hate me for this, but I need it
vim.keymap.set('n', ';', ':')
vim.keymap.set('n', '\'', ';')

-- Custom scripts
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Window navigation
vim.keymap.set('n', '<C-Left>', '<C-w>h')
vim.keymap.set('n', '<C-Down>', '<C-w>j')
vim.keymap.set('n', '<C-Up>', '<C-w>k')
vim.keymap.set('n', '<C-Right>', '<C-w>l')

-- Quickfix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- Clear highlights for search
vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<cr>", { desc = "Clear highlights" })

-- Move lines
vim.keymap.set('v', '<A-Down>', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', '<A-Up>', ":m '<-2<CR>gv=gv")
vim.keymap.set('n', '<A-Down>', ':m .+1<CR>==')
vim.keymap.set('n', '<A-Up>', ':m .-2<CR>==')

-- Scroll & center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Substitute
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set('v', '<leader>s', '"hy:%s/<C-r>h/<C-r>h/g<Left><Left>')

-- Copy, Cut, Paste, Select
vim.keymap.set("n", 'yw', 'yiw')
vim.keymap.set("n", 'cw', '"_ciw')
vim.keymap.set("n", 'ci"', '"_ci')
vim.keymap.set("n", 'dw', '"_diw')
vim.keymap.set("n", 'vw', 'viw')
vim.keymap.set("v", "p", '"_dP')
vim.keymap.set({ "n", "v" }, "S", '"_S')
vim.keymap.set({ "n", "v" }, "x", '"_x')
vim.keymap.set({ "n", "v" }, "s", '"_s')
vim.keymap.set({ "n", "v" }, "d", '"_d')

-- File navigation
vim.keymap.set({ "n", "v" }, "gg", "gg0")
vim.keymap.set({ "n", "v" }, "G", "G$")

-- Indentation
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('n', '>', '>>')
vim.keymap.set('n', '<', '<<')

-- Buffers
vim.keymap.set("n", "<C-c>", "<cmd>%y+<CR>")
vim.keymap.set("n", "<C-a>", "gg<S-v>G")
vim.keymap.set('n', '<Tab>', '<C-6>')
