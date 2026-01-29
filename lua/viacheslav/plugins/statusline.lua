return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup {
            options = {
                theme = "auto",
                component_separators = '',
                section_separators = { left = '', right = '' },
                globalstatus = true,
            },
            sections = {
                lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
                lualine_b = { 'branch', 'diff' },
                lualine_c = { 'filename', 'diagnostics' },
                lualine_x = {},
                lualine_y = { 'filetype' },
                lualine_z = { { 'location', separator = { right = '' }, left_padding = 2 } },
            },
        }
    end
}
