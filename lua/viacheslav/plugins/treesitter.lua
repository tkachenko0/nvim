return {

    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("nvim-treesitter-textobjects").setup({
                select = {
                    lookahead = true,
                },
            })

            local select = require("nvim-treesitter-textobjects.select")
            for _, mode in ipairs({ "x", "o" }) do
                vim.keymap.set(mode, "af", function()
                    select.select_textobject("@function.outer", "textobjects", mode)
                end)
                vim.keymap.set(mode, "if", function()
                    select.select_textobject("@function.inner", "textobjects", mode)
                end)
                vim.keymap.set(mode, "ac", function()
                    select.select_textobject("@class.outer", "textobjects", mode)
                end)
                vim.keymap.set(mode, "ic", function()
                    select.select_textobject("@class.inner", "textobjects", mode)
                end)
            end
        end,
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
            })
        end,
    },

    {
        "MeanderingProgrammer/treesitter-modules.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        opts = {
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<M-w>",
                    node_incremental = "<M-w>",
                    node_decremental = "<M-W>",
                },
            },
        },
    },
}
