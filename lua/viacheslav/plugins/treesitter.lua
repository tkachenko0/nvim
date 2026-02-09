return {

    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter").setup({
                ensure_installed = {
                    "vimdoc",
                    "javascript",
                    "typescript",
                    "tsx",
                    "lua",
                    "jsdoc",
                    "html",
                    "go",
                    "json",
                    "yaml",
                    "css",
                    "python",
                    "terraform",
                    "sql",
                    "toml",
                },
                sync_install = false,
                auto_install = true,
                indent = { enable = true },
                highlight = {
                    enable = true,
                },
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = "@class.inner",
                        },
                    },
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<M-w>",
                        node_incremental = "<M-w>",
                        node_decremental = "<M-W>",
                    },
                },
                fold = { enable = true },
            })
        end,
    },
}
