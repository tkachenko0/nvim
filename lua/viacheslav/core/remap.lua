vim.g.mapleader = " "

-- Hate me for this, but I need it
vim.keymap.set('n', ';', ':')

-- Remaps for beginning and end of line
vim.keymap.set({ 'n', 'v' }, 'B', '_', { desc = 'Go to beginning of line' })
vim.keymap.set({ 'n', 'v' }, 'E', '$', { desc = 'Go to end of line' })

-- Custom scripts
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Move between windows (Will learn hjkl later)
vim.keymap.set('n', '<C-Left>', '<C-w>h', { desc = 'Move to left split' })
vim.keymap.set('n', '<C-Down>', '<C-w>j', { desc = 'Move to below split' })
vim.keymap.set('n', '<C-Up>', '<C-w>k', { desc = 'Move to above split' })
vim.keymap.set('n', '<C-RIght>', '<C-w>l', { desc = 'Move to right split' })

-- Clear highlights for search
vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<cr>", { desc = "Clear highlights" })

-- Move lines up and down (Will learn hjkl later)
vim.keymap.set('v', '<A-Down>', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
vim.keymap.set('v', '<A-Up>', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })
vim.keymap.set('n', '<A-Down>', ':m .+1<CR>==', { desc = 'Move line down' })
vim.keymap.set('n', '<A-Up>', ':m .-2<CR>==', { desc = 'Move line up' })

-- Vertical scroll and center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Substitute
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Substitute word under cursor (whole word, global, case-insensitive)" })
vim.keymap.set('v', '<leader>s', '"hy:%s/<C-r>h/<C-r>h/g<Left><Left>',
    { desc = 'Substitute selected text in entire file' })

-- Not copy when deleting
vim.keymap.set("n", "x", '"_x', { silent = true })
vim.keymap.set("n", "c", '"_c', { silent = true })
vim.keymap.set("n", "S", '"_S', { silent = true })
vim.keymap.set({ "n", "v" }, "s", '"_s', { silent = true })
vim.keymap.set({ "n", "v" }, "d", '"_d', { silent = true })

-- Go to beginning and end of the file
vim.keymap.set({ "n", "v" }, "gg", "gg0")
vim.keymap.set({ "n", "v" }, "G", "G$")

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Buffers
vim.keymap.set("n", "<C-c>", "<cmd>%y+<CR>", { desc = "Copy the whole file" })
vim.keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })
vim.keymap.set('n', '<Tab>', '<C-6>', { noremap = true, silent = true }, { desc = 'Switch to last buffer' })
vim.keymap.set("n", "Q", ":qa<CR>", { desc = "Quit all" })

-- vim.keymap.set('n', '<A-Left>', '<Cmd>bprevious<CR>', { desc = 'Previous buffer' })
-- vim.keymap.set('n', '<A-Right>', '<Cmd>bnext<CR>', { desc = 'Next buffer' })
-- vim.keymap.set('n', '<leader>x', '<Cmd>bdelete<CR>', { desc = 'Close right buffer' })
