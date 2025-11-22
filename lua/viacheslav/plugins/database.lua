return {

    {
        {
            'tpope/vim-dadbod',
            dependencies = {
                'kristijanhusak/vim-dadbod-ui',
                'kristijanhusak/vim-dadbod-completion',
            },
            config = function()
                -- Global variables for dadbod-ui
                vim.g.db_ui_use_nerd_fonts = 1
                vim.g.db_ui_show_database_icon = 1
                vim.g.db_ui_force_echo_messages = 1
                vim.g.db_ui_win_position = 'left'
                vim.g.db_ui_winwidth = 40

                -- Auto-completion setup
                vim.api.nvim_create_autocmd('FileType', {
                    pattern = { 'sql', 'mysql', 'plsql' },
                    callback = function()
                        require('cmp').setup.buffer({
                            sources = {
                                { name = 'vim-dadbod-completion' },
                                { name = 'buffer' },
                            }
                        })
                    end,
                })

                -- Keymaps
                vim.keymap.set('n', '<leader>db', '<cmd>DBUIToggle<CR>', { desc = 'Toggle DBUI' })
                vim.keymap.set('n', '<leader>df', '<cmd>DBUIFindBuffer<CR>', { desc = 'Find DB buffer' })
                vim.keymap.set('n', '<leader>dr', '<cmd>DBUIRenameBuffer<CR>', { desc = 'Rename DB buffer' })
                vim.keymap.set('n', '<leader>dq', '<cmd>DBUILastQueryInfo<CR>', { desc = 'Last query info' })
                vim.keymap.set('n', '<leader>rr', ':%DB<CR>', { desc = 'Run SQL file' })
                vim.keymap.set('v', '<leader>rr', ':DB<CR>', { desc = 'Run SQL selection' })
            end,
        }
    }

}
