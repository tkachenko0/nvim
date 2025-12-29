vim.g.mapleader = " "

-- Hate me for this, but I need it
vim.keymap.set('n', ';', ':')
vim.keymap.set('n', '\'', ';')

-- Remaps for beginning and end of line
vim.keymap.set({ 'n', 'v' }, 'B', '_', { desc = 'Go to beginning of line' })
vim.keymap.set({ 'n', 'v' }, 'E', '$', { desc = 'Go to end of line' })

-- Custom scripts
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Move between windows
vim.keymap.set('n', '<C-Left>', '<C-w>h')
vim.keymap.set('n', '<C-Down>', '<C-w>j')
vim.keymap.set('n', '<C-Up>', '<C-w>k')
vim.keymap.set('n', '<C-RIght>', '<C-w>l')

-- Quickfix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- Clear highlights for search
vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<cr>", { desc = "Clear highlights" })

-- Move lines up and down
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv")
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==')
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==')

-- Vertical scroll and center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Substitute
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set('v', '<leader>s', '"hy:%s/<C-r>h/<C-r>h/g<Left><Left>')

-- Not copy when deleting
vim.keymap.set({ "n", "v" }, "S", '"_S')
vim.keymap.set({ "n", "v" }, "x", '"_x')
vim.keymap.set({ "n", "v" }, "s", '"_s')
vim.keymap.set({ "n", "v" }, "d", '"_d')

-- Paste without overwriting the unnamed register
vim.keymap.set("v", "p", '"_dP', { silent = true })

-- Go to beginning and end of the file
vim.keymap.set({ "n", "v" }, "gg", "gg0")
vim.keymap.set({ "n", "v" }, "G", "G$")

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('n', '>', '>>')
vim.keymap.set('n', '<', '<<')

-- Buffers
vim.keymap.set("n", "<C-c>", "<cmd>%y+<CR>", { desc = "Copy the whole file" })
vim.keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })
vim.keymap.set('n', '<Tab>', '<C-6>', { noremap = true }, { desc = 'Switch to last buffer' })
vim.keymap.set("n", "Q", ":qa<CR>", { desc = "Quit all" })
vim.keymap.set('n', '<leader>X', '<Cmd>bdelete<CR>', { desc = 'Close right buffer' })

-- Deletions
vim.keymap.set("n", 'cw', '"_ciw')
vim.keymap.set("n", 'dw', '"_diw')
vim.keymap.set("n", 'yw', 'yiw')
vim.keymap.set("n", 'vw', 'viw')
