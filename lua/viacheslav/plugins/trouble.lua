return {
  'folke/trouble.nvim',
  opts = {
    focus = true,
  },
  cmd = 'Trouble',
  keys = {
    { '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>' },
  },
  config = function() require('trouble').setup {} end,
}
