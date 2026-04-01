return {
  'tpope/vim-dadbod',
  dependencies = {
    'kristijanhusak/vim-dadbod-ui',
    'kristijanhusak/vim-dadbod-completion',
  },
  cmd = { 'DBUI', 'DBUIToggle', 'DBUIAddConnection', 'DB' },
  keys = {
    { '<leader>r', ':%DB<CR>', mode = 'n' },
    { '<leader>r', ':DB<CR>',  mode = 'v' },
  },
  init = function()
    vim.g.db_ui_show_database_icon = 0
    vim.g.db_ui_force_echo_messages = 1
    vim.g.db_ui_execute_on_save = 0
    vim.g.db_ui_save_location = '~/dev/databases'
  end,
}
