return {
  'goolord/alpha-nvim',
  enabled = true,
  config = function()
    local alpha = require 'alpha'
    local startify = require 'alpha.themes.startify'
    startify.file_icons.enabled = false
    startify.section.top_buttons.val = {}
    startify.section.mru.val = { { type = 'padding', val = 0 } }
    startify.section.bottom_buttons.val = {}
    alpha.setup(startify.opts)
  end,
}
