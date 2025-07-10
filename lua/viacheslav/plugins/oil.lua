return {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    lazy = false,
    config = function()
        require('oil').setup({
            columns = {
                -- "icon",
                -- "permissions",
                -- "size",
                -- "mtime",

            },
            view_options = {
                show_hidden = true,
            },
            keymaps = {
                ["<C-c>"] = { "actions.close", mode = "n" },
            },
        })
        vim.keymap.set("n", "\\", "<CMD>Oil<CR>", { desc = "Open parent directory" })
        vim.api.nvim_set_hl(0, "OilHidden", { fg = "#6c7086" })
    end,
}
