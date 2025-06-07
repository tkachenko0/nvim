return
{

    {
        "Mofiqul/vscode.nvim",
        config = function()
            require("vscode").setup({
                transparent = true,
                italic_comments = false,
                disable_nvimtree_bg = true,
            })
            vim.cmd("colorscheme vscode")

            -- Git diff colors (Visual Studio-like)
            vim.cmd([[
                highlight DiffAdd    guibg=#144212 guifg=NONE gui=NONE
                highlight DiffDelete guibg=#600000 guifg=NONE gui=NONE
                highlight DiffChange guibg=#1B2A4A guifg=NONE gui=NONE
                highlight DiffText   guibg=#265478 gui=bold
            ]])
        end,
    },

}
