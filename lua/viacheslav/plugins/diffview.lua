return {
    'sindrets/diffview.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    cmd = {
        'DiffviewOpen',
        'DiffviewClose',
        'DiffviewToggleFiles',
        'DiffviewFocusFiles',
        'DiffviewRefresh',
        'DiffviewFileHistory',
    },
    keys = {
        { '<leader>dv', '<cmd>DiffviewOpen<cr>',        desc = 'Open Diffview' },
        { '<leader>dh', '<cmd>DiffviewFileHistory<cr>', desc = 'File History' },
        { '<leader>dc', '<cmd>DiffviewClose<cr>',       desc = 'Close Diffview' },
    },
    config = function()
        require('diffview').setup({})
    end,
}
