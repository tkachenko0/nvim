return {
  'nvim-lualine/lualine.nvim',
  dependencies = { { 'nvim-tree/nvim-web-devicons', enabled = false } },
  config = function()
    require('lualine').setup {
      options = {
        theme = 'auto',
        globalstatus = true,
        icons_enabled = false,
      },
      sections = {
        lualine_a = { 'branch' },
        lualine_b = { 'filename' },
        lualine_c = { 'diagnostics' },
        lualine_x = {},
        lualine_y = { 'filetype' },
        lualine_z = {},
      },
    }
  end,
}
