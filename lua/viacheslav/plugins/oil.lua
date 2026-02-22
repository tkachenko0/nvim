return {
    'stevearc/oil.nvim',
    opts = {},
    lazy = false,
    config = function()
        require('oil').setup({
            columns = {
            },
            view_options = {
                show_hidden = true,
            },
            keymaps = {
                ["<C-c>"] = { "actions.close", mode = "n" },
            },
        })
        vim.keymap.set("n", "\\", "<CMD>Oil<CR>")
        vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>")
    end,
}
