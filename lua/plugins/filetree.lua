return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  config = function()
    require('neo-tree').setup {
      window = {
        mappings = {
          ['<cr>'] = 'open',
          ['<Tab>'] = 'next_source',
          ['l'] = 'toggle_node',
          ['h'] = 'close_node',
        },
      },
      filesystem = {
        follow_current_file = {
          enabled = true,
          leave_dirs_open = true,
        },
        filtered_items = {
          visible = true,
          show_hidden_count = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        use_libuv_file_watcher = true,
      },
    }
  end,
}
