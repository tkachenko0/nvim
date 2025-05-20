vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })

vim.keymap.set('n', ';', ':')

-- Clear highlights for search
vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<cr>", { desc = "Clear highlights" })

-- Move lines up and down
vim.keymap.set('v', '<M-Down>', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', '<M-Up>', ":m '<-2<CR>gv=gv")

-- Vertical scroll and center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Find and center
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("i", "<C-c>", "<Esc>")

-- Substitute
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>")

-- to not copy when deleting
vim.keymap.set("n", "x", '"_x', { silent = true })
vim.keymap.set("n", "d", '"_d', { silent = true })
vim.keymap.set("n", "c", '"_c', { silent = true })
vim.keymap.set("n", "s", '"_s', { silent = true })
vim.keymap.set("v", "s", '"_s', { silent = true })

-- Go to beginning and end of the file
vim.keymap.set("n", "gg", "gg0")
vim.keymap.set("n", "G", "G$")
vim.keymap.set("v", "G", "G$")

-- Buffers
vim.keymap.set('n', '<Tab>', '<C-6>', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>x", ":bd<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "Q", ":qa<CR>", { desc = "Quit all" })
vim.keymap.set('n', '<A-Left>', '<C-o>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-Right>', '<C-i>', { noremap = true, silent = true })

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)
