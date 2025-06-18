return {

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
            vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#005a00", fg = "NONE" })
            vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#5f0000", fg = "NONE" })
            vim.api.nvim_set_hl(0, "DiffChange", { bg = "#1B2A4A", fg = "NONE" })
            vim.api.nvim_set_hl(0, "DiffText", { bg = "#265478", bold = true })
        end,
    },

}
