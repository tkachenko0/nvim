return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local diagnostics_config = {
            'diagnostics',
            sources = { "nvim_diagnostic" },
            symbols = {
                error = ' ', warn = ' ', info = ' ', hint = ' '
            }
        }
        local filename_config = {
            'filename',
            file_status = true, -- shows file status (readonly, modified)
            path = 0            -- 0 = just filename, 1 = relative path, 2 = absolute path
        }
        require("lualine").setup {
            options = {
                icons_enabled = true,
                theme = 'vscode',
                section_separators = { left = '', right = '' },
                component_separators = { left = '', right = '' },
                disabled_filetypes = {}
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch' },
                lualine_c = { filename_config },
                lualine_x = { diagnostics_config, 'encoding', 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {
                    {
                        'filename',
                        file_status = true,
                        path = 1 -- Show relative path in inactive sections
                    }
                },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            extensions = { 'fugitive' }
        }
    end
}
