return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup {
            options = {
                section_separators = { left = '', right = '' },
                component_separators = { left = '', right = '' },
            },
            sections = {
                lualine_a = {
                    {
                        'mode',
                        separator = { right = '' },
                    },
                },
                lualine_b = {
                    {
                        'branch',
                        right_padding = 0,
                    },
                },
                lualine_c = {
                    'diagnostics',

                },
                lualine_x = {
                    'diff',
                },
                lualine_y = {
                    'filetype',
                },
                lualine_z = {},
            },
            extensions = { 'fugitive' },
        }
    end
}
