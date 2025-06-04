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
                    "jsdoc",
                    "html",
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
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<M-w>",    -- Alt-w to start selection
                        node_incremental = "<M-w>",  -- Alt-w to expand
                        node_decremental = "<M-W>",  -- Alt-Shift-w to shrink
                        scope_incremental = "<M-s>", -- Optional: Alt-s for scope
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
