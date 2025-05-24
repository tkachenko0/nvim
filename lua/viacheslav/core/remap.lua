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

-- to not copy when deleting
vim.keymap.set("n", "x", '"_x', { silent = true })
vim.keymap.set("n", "d", '"_d', { silent = true })
vim.keymap.set("v", "d", '"_d', { silent = true })
vim.keymap.set("n", "c", '"_c', { silent = true })
vim.keymap.set("n", "s", '"_s', { silent = true })
vim.keymap.set("v", "s", '"_s', { silent = true })
vim.keymap.set("n", "S", '"_S', { silent = true })

-- Go to beginning and end of the file
vim.keymap.set("n", "gg", "gg0")
vim.keymap.set("n", "G", "G$")
vim.keymap.set("v", "G", "G$")

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Buffers
vim.keymap.set('n', '<Tab>', '<C-6>', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>x", ":bd<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "Q", ":qa<CR>", { desc = "Quit all" })

-- Cycle through normal buffers with Alt+Left and Alt+Right
vim.keymap.set('n', '<A-Left>', function()
    local bufnrs = vim.tbl_filter(function(b)
        -- Filter out non-normal buffers (like NeoTree)
        return vim.bo[b].buflisted
            and vim.api.nvim_buf_is_valid(b)
            and vim.bo[b].buftype == ''
    end, vim.api.nvim_list_bufs())

    if #bufnrs <= 1 then return end

    local current = vim.api.nvim_get_current_buf()
    local index = 0
    for i, bufnr in ipairs(bufnrs) do
        if bufnr == current then
            index = i
            break
        end
    end

    -- Move to previous buffer in the list (wrapping around if needed)
    local prev_index = index - 1
    if prev_index < 1 then prev_index = #bufnrs end
    vim.api.nvim_set_current_buf(bufnrs[prev_index])
end, { noremap = true, silent = true })

vim.keymap.set('n', '<A-Right>', function()
    local bufnrs = vim.tbl_filter(function(b)
        -- Filter out non-normal buffers (like NeoTree)
        return vim.bo[b].buflisted
            and vim.api.nvim_buf_is_valid(b)
            and vim.bo[b].buftype == ''
    end, vim.api.nvim_list_bufs())

    if #bufnrs <= 1 then return end

    local current = vim.api.nvim_get_current_buf()
    local index = 0
    for i, bufnr in ipairs(bufnrs) do
        if bufnr == current then
            index = i
            break
        end
    end

    -- Move to next buffer in the list (wrapping around if needed)
    local next_index = index + 1
    if next_index > #bufnrs then next_index = 1 end
    vim.api.nvim_set_current_buf(bufnrs[next_index])
end, { noremap = true, silent = true })
