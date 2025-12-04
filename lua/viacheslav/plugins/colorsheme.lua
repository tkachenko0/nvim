return {
    "Mofiqul/vscode.nvim",
    config = function()
        require("vscode").setup({
            transparent = true,
        })
        vim.cmd("colorscheme vscode")
        -- Git diff colors (Visual Studio-like)
        vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#005a00", fg = "NONE" })
        vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#5f0000", fg = "NONE" })
        vim.api.nvim_set_hl(0, "DiffChange", { bg = "#1B2A4A", fg = "NONE" })
        vim.api.nvim_set_hl(0, "DiffText", { bg = "#265478", bold = true })
    end,
}



-- return {
--     { "folke/tokyonight.nvim" },
--     { "catppuccin/nvim", name = "catppuccin" },
--     { "rebelot/kanagawa.nvim" },
--     { "EdenEast/nightfox.nvim" },
--     { "rose-pine/neovim", name = "rose-pine" },
--     { "Mofiqul/vscode.nvim" },
--     { "navarasu/onedark.nvim" },
--     { "projekt0n/github-nvim-theme" },
--     { "sainnhe/gruvbox-material" },
--     { "sainnhe/everforest" },
--     { "sainnhe/sonokai" },
--     { "Mofiqul/dracula.nvim" },
--     { "marko-cerovac/material.nvim" },
--     { "bluz71/vim-nightfly-colors", name = "nightfly" },
--     { "bluz71/vim-moonfly-colors", name = "moonfly" },
--     { "shaunsingh/nord.nvim" },
--     { "olimorris/onedarkpro.nvim" },
--     { "AlexvZyl/nordic.nvim" },
--     { "Shatur/neovim-ayu" },
--     { "Everblush/nvim", name = "everblush" },
--     { "kvrohit/mellow.nvim" },
--     { "Yazeed1s/minimal.nvim" },
--     {
--         "rktjmp/lush.nvim",
--         config = function()
--             local themes = {
--                 "tokyonight", "catppuccin", "kanagawa", "nightfox", "rose-pine",
--                 "vscode", "onedark", "github_dark", "gruvbox-material", "everforest",
--                 "sonokai", "dracula", "material", "nightfly", "moonfly",
--                 "nord", "onedarkpro", "nordic", "ayu-dark", "everblush",
--                 "mellow", "minimal"
--             }
--
--             vim.cmd("colorscheme vscode")
--
--             vim.keymap.set("n", "<leader>th", function()
--                 vim.ui.select(themes, { prompt = "Scegli tema:" }, function(choice)
--                     if choice then
--                         pcall(vim.cmd, "colorscheme " .. choice)
--                     end
--                 end)
--             end, { desc = "Cambia tema" })
--         end,
--     },
-- }
--
