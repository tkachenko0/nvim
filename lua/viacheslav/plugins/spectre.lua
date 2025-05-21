return {
    "nvim-pack/nvim-spectre",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    config = function()
        require('spectre').setup({})
        vim.keymap.set('n', '<leader>S', function()
            -- Check if Neo-tree is open and close it
            for _, win in ipairs(vim.api.nvim_list_wins()) do
                local buf = vim.api.nvim_win_get_buf(win)
                local buf_name = vim.api.nvim_buf_get_name(buf)
                if buf_name:match("neo%-tree") then
                    vim.api.nvim_win_close(win, false)
                    break
                end
            end
            vim.cmd('Spectre')
        end, { desc = 'Open search panel' })
    end,
}
