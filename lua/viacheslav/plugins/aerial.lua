return {
    "stevearc/aerial.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        { "<leader>a", "<cmd>AerialToggle!<CR>", desc = "Toggle Aerial outline" },
    },
    opts = {
        lazy_load = true,
        layout = { min_width = 28 },
        backends = {
            "lsp",
            "treesitter",
            "markdown",
            "man"
        },
        attach_mode = "global",
        highlight_mode = "split_width",
        highlight_closest = true,
        highlight_on_hover = true,
        highlight_on_jump = 300,
        show_guides = true,
        float = {
            border = "rounded",
            relative = "cursor",
        },
    },
}
