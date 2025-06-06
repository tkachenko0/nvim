return
{

    -- {
    --     "nickkadutskyi/jb.nvim",
    --     enabled = true,
    --     lazy = false,
    --     priority = 1000,
    --     opts = {},
    --     config = function()
    --         require("jb").setup({
    --             transparent = true
    --         })
    --         vim.cmd("colorscheme jb")
    --     end,
    -- },

    {
        "Mofiqul/vscode.nvim",
        config = function()
            require("vscode").setup({
                transparent = true,
                italic_comments = false,
                disable_nvimtree_bg = true,
            })
            vim.cmd("colorscheme vscode")
        end,
    },

}
