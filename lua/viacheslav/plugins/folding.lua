return {
  'kevinhwang91/nvim-ufo',
  dependencies = { 'kevinhwang91/promise-async' },
  event = 'BufReadPost',  -- Load when a buffer is read
  config = function()
    -- Basic Vim settings for folding
    vim.o.foldcolumn = '1'
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    -- Keymaps for folding operations
    vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

    -- Setup for ufo using LSP + indent as fallback
    require('ufo').setup({
      provider_selector = function()
        return { 'lsp', 'indent' }
      end,
    })
  end
}

