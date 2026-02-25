return {

  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      local select = require 'nvim-treesitter-textobjects.select'
      for _, mode in ipairs { 'x', 'o' } do
        vim.keymap.set(mode, 'af', function() select.select_textobject('@function.outer', 'textobjects', mode) end)
        vim.keymap.set(mode, 'if', function() select.select_textobject('@function.inner', 'textobjects', mode) end)
        vim.keymap.set(mode, 'ac', function() select.select_textobject('@class.outer', 'textobjects', mode) end)
        vim.keymap.set(mode, 'ic', function() select.select_textobject('@class.inner', 'textobjects', mode) end)
      end
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      local parsers = {
        'bash',
        'c',
        'diff',
        'html',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'query',
        'vim',
        'vimdoc',
        'javascript',
        'typescript',
        'tsx',
        'jsdoc',
        'json',
        'yaml',
        'css',
        'python',
        'terraform',
        'sql',
        'toml',
        'c_sharp',
      }
      require('nvim-treesitter').install(parsers)

      vim.api.nvim_create_autocmd('FileType', {
        pattern = {
          'typescriptreact',
          unpack(parsers),
        },
        callback = function() vim.treesitter.start() end,
      })
    end,
  },

  {
    'MeanderingProgrammer/treesitter-modules.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<M-w>',
          node_incremental = '<M-w>',
          node_decremental = '<M-W>',
        },
      },
    },
  },
}
