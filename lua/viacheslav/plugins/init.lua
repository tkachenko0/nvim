return {
    {
        "nvim-lua/plenary.nvim",
        name = "plenary"
    },
    "github/copilot.vim",
    "eandrju/cellular-automaton.nvim",
    "gpanders/editorconfig.nvim",
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup()
        end,
    },
    {
    "laytan/cloak.nvim",
    config = function()
        require("cloak").setup({
            enabled = true,
            cloak_character = "*",
            highlight_group = "Comment",
            patterns = {
                {
                    file_pattern = {
                        ".env*",
                        "wrangler.toml",
                        ".dev.vars",
                    },
                    cloak_pattern = "=.+"
                },
            },
        })
    end
}
}
