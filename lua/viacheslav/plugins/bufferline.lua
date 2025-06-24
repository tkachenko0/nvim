return {
    'willothy/nvim-cokeline',
    -- enabled = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        require('cokeline').setup({
            show_if_buffers_are_at_least = 1,
            default_hl = {
                fg = function(buffer)
                    return buffer.is_focused and '#cccccc' or '#888888'
                end,
                bg = function(buffer)
                    return buffer.is_focused and '#3c3836' or '#1d2021'
                end,
            },
        })
        vim.keymap.set('n', '<A-Left>', '<Plug>(cokeline-focus-prev)')
        vim.keymap.set('n', '<A-Right>', '<Plug>(cokeline-focus-next)')
        vim.keymap.set('n', '<leader>x', '<Cmd>bdelete<CR>')
    end,
}
