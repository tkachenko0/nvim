return {

    {
        {
            'tpope/vim-dadbod',
            dependencies = {
                'kristijanhusak/vim-dadbod-ui',
                'kristijanhusak/vim-dadbod-completion',
            },
            config = function()
                vim.g.db_ui_use_nerd_fonts = 1
                vim.g.db_ui_show_database_icon = 1
                vim.g.db_ui_force_echo_messages = 1
                vim.g.db_ui_execute_on_save = 0 -- Disable auto-execution on save
                vim.g.db_ui_save_location = '~/dev/databases'

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

                vim.keymap.set('n', '<leader>db', '<cmd>DBUIToggle<CR>', { desc = 'Toggle DBUI' })
                vim.keymap.set('n', '<leader>r', ':%DB<CR>', { desc = 'Run SQL file' })
                vim.keymap.set('v', '<leader>r', ':DB<CR>', { desc = 'Run SQL selection' })
            end,
        }
    }

}
