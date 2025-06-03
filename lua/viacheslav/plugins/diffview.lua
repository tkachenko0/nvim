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
        require('diffview').setup({
            keymaps = {
                file_panel = {
                    { "n", "a", require("diffview.actions").toggle_stage_entry, { desc = "Stage / unstage the selected entry." } },
                },
            },
            hooks = {
                view_opened = function()
                    -- Hide tabline/bufferline when diffview opens
                    vim.opt.showtabline = 0
                end,
                view_closed = function()
                    -- Restore tabline/bufferline when diffview closes
                    vim.opt.showtabline = 2
                end,
            },
        })
    end,
}
