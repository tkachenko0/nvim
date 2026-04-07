return {

  {
    'laytan/cloak.nvim',
    config = function() require('cloak').setup() end,
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

  {
    'stevearc/aerial.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    keys = {
      { '<leader>a', '<cmd>AerialToggle!<CR>' },
    },
    opts = {},
  },
}
