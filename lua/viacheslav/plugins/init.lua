return {

    {
        "nvim-lua/plenary.nvim",
        name = "plenary"
    },

    -- "github/copilot.vim",

    -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',

    {
        'windwp/nvim-ts-autotag',
        config = function()
            require('nvim-ts-autotag').setup({
                opts = {
                    enable_close = true,
                    enable_rename = true,
                    enable_close_on_slash = true
                },
            })
        end,
    },

    "RRethy/vim-illuminate",

    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup({
                "css",
                "scss",
                "lua",
                "tsx",
                "html",
                "less",
                "tmux",
                "typescriptreact",
            })
        end
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
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        opts = {
            indent = {
                char = '▏',
            },
            scope = {
                show_start = false,
                show_end = false,
                show_exact_scope = false,
            },
            exclude = {
                filetypes = {
                    'help',
                    'startify',
                    'dashboard',
                    'packer',
                    'neogitstatus',
                    'NvimTree',
                    'Trouble',
                },
            },
        },
    },
}
