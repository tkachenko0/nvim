return {
    'willothy/nvim-cokeline',
    -- enabled = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        require('cokeline').setup({
            show_if_buffers_are_at_least = 2,
        })
        vim.keymap.set('n', '<A-Left>', '<Plug>(cokeline-focus-prev)')
        vim.keymap.set('n', '<A-Right>', '<Plug>(cokeline-focus-next)')
        vim.keymap.set('n', '<leader>x', '<Cmd>bdelete<CR>')
    end,
}
