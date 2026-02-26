return {

  {
    'nvim-lua/plenary.nvim',
    name = 'plenary',
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
