return {
    'willothy/nvim-cokeline',
    -- enabled = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        require('cokeline').setup({
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
