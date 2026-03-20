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
          'javascriptreact',
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

  {
    "nvim-treesitter/nvim-treesitter-context",
    after = "nvim-treesitter",
    config = function()
      require("treesitter-context").setup({
        enable = true,            -- Enable this plugin (Can be enabled/disabled later via commands)
        multiwindow = false,      -- Enable multiwindow support.
        max_lines = 1,            -- How many lines the window should span. Values <= 0 mean no limit.
        min_window_height = 0,    -- Minimum editor window height to enable context. Values <= 0 mean no limit.
        line_numbers = true,
        multiline_threshold = 20, -- Maximum number of lines to show for a single context
        trim_scope = "outer",     -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
        mode = "cursor",          -- Line used to calculate context. Choices: 'cursor', 'topline'
        -- Separator between context and content. Should be a single character string, like '-'.
        -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
        separator = nil,
        zindex = 20,     -- The Z-index of the context window
        on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
      })
    end,
  },
}
