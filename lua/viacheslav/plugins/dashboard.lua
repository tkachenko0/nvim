return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  dependencies = { { 'nvim-tree/nvim-web-devicons' } },
  config = function()
    require('dashboard').setup {
      theme = 'hyper',
      config = {
        project = { enable = false },
        header = {
          "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
          "⠀⠀⠀⠀⠀⠀¯\\_(ツ)_/¯⠀⠀⠀⠀⠀⠀",
        },
        footer = {},
        shortcut = {},
        mru = {
          limit = 10,
          cwd_only = true,
        },
      },
    }
  end,
}
