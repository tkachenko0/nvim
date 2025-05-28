return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "vimdoc",
                    "javascript",
                    "typescript",
                    "tsx",
                    "lua",
                    "rust",
                    "jsdoc",
                    "bash",
                    "html",
                    "json",
                    "yaml",
                    "markdown",
                    "markdown_inline",
                    "css",
                    "python",
                    "regex",
                    "terraform",
                    "sql",
                    "dockerfile",
                    "toml",
                    "java",
                    "go",
                    "gitignore",
                },
                sync_install = false,
                auto_install = true,
                indent = { enable = true },
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = { "markdown" },
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
                fold = { enable = true },
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },
}
