vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })

vim.keymap.set('n', ';', ':')

vim.keymap.set('v', '<M-Down>', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', '<M-Up>', ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>")

-- to not copy when deleting
vim.keymap.set("n", "x", '"_x', { silent = true })
vim.keymap.set("n", "d", '"_d', { silent = true })
vim.keymap.set("n", "c", '"_c', { silent = true })
vim.keymap.set("n", "s", '"_s', { silent = true })
vim.keymap.set("v", "s", '"_s', { silent = true })

vim.keymap.set("n", "gg", "gg0")
vim.keymap.set("n", "G", "G$")
vim.keymap.set("v", "G", "G$")

vim.keymap.set('n', '<Tab>', '<C-6>', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>q", ":bd<CR>", { desc = "Close buffer" })

vim.keymap.set("n", "Q", ":qa<CR>", { desc = "Quit all" })
