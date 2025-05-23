return {
    {
        "nvim-lua/plenary.nvim",
        name = "plenary"
    },
    "github/copilot.vim",
    "gpanders/editorconfig.nvim",
    'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
    {
        "RRethy/vim-illuminate",
        event = "VeryLazy",
        config = function()
            require('illuminate').configure({
                providers = {
                    'lsp',
                    'treesitter',
                    'regex',
                },
                delay = 100,
            })
        end,
    },
    {
        "mbbill/undotree",
        config = function()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
        end
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup()
        end,
    },
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup({
                "*",
                css = { rgb_fn = true },
                html = { names = true },
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
}
