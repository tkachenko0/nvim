return {
  'Mofiqul/vscode.nvim',
  config = function()
    require('vscode').setup {}
    vim.cmd 'colorscheme vscode'
    vim.api.nvim_set_hl(0, 'DiffAdd', { bg = '#005a00', fg = 'NONE' })
    vim.api.nvim_set_hl(0, 'DiffDelete', { bg = '#5f0000', fg = 'NONE' })
    vim.api.nvim_set_hl(0, 'DiffChange', { bg = '#1d2433', fg = 'NONE' })
    vim.api.nvim_set_hl(0, 'DiffText', { bg = '#265478', bold = true })
  end,
}
