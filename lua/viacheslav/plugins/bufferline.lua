return {
    'willothy/nvim-cokeline',
    -- enabled = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        local get_hex = require('cokeline.hlgroups').get_hl_attr
        require('cokeline').setup({
            default_hl = {
                fg = function(buffer)
                    return buffer.is_focused
                        and get_hex('Normal', 'fg')
                        or get_hex('Normal', 'fg')
                end,
                bg = function(buffer)
                    return buffer.is_focused
                        and get_hex('ColorColumn', 'bg')
                        or get_hex('TabLine', 'bg')
                end,
            },
            sidebar = {
                filetype = { 'NvimTree', 'neo-tree' },
                components = {
                    {
                        text = function(buf)
                            return buf.filetype
                        end,
                    },
                }
            },
        })

        local map = vim.keymap.set
        map('n', '<A-Left>', '<Plug>(cokeline-focus-prev)', { desc = 'Previous buffer' })
        map('n', '<A-Right>', '<Plug>(cokeline-focus-next)', { desc = 'Next buffer' })
    end,
}
