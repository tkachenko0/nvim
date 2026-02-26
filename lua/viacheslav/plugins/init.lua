return {

  {
    'nvim-lua/plenary.nvim',
    name = 'plenary',
  },

  {
    'goolord/alpha-nvim',
    enabled = false,
    config = function()
      local alpha = require 'alpha'
      local startify = require 'alpha.themes.startify'
      startify.file_icons.enabled = false
      startify.section.top_buttons.val = {}
      startify.section.mru.val = { { type = 'padding', val = 0 } }
      startify.section.bottom_buttons.val = {}
      alpha.setup(startify.opts)
    end,
  },

  { 'NMAC427/guess-indent.nvim', opts = {} },

  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup {
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = true,
        },
      }
    end,
  },

  'RRethy/vim-illuminate',

  {
    'mbbill/undotree',
    config = function() vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle) end,
  },

  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function() require('nvim-autopairs').setup() end,
  },
}
