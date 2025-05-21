return {
    {
        "nvim-lua/plenary.nvim",
        name = "plenary"
    },
    "github/copilot.vim",
    "gpanders/editorconfig.nvim",
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup()
        end,
    },
    {
        'folke/todo-comments.nvim',
        event = 'VimEnter',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = { signs = false },
    },
    {
        "norcalli/nvim-colorizer.lua", -- Colorizer plugin
        config = function()
            require("colorizer").setup({
                "*",                     -- Apply to all filetypes
                css = { rgb_fn = true }, -- Support RGB functions in CSS
                html = { names = true }, -- Support color names in HTML
            })
        end
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
    },
    {
        -- Detect tabstop and shiftwidth automatically
        'tpope/vim-sleuth',
    },

}
