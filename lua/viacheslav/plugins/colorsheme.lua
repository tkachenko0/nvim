return
{

    {
        "Mofiqul/vscode.nvim",
        -- enabled = false,
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
