return {

  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        delay = 0,
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local function map(mode, l, r)
          vim.keymap.set(mode, l, r, { buffer = bufnr })
        end
        map('n', '[c', gs.prev_hunk)
        map('n', ']c', gs.next_hunk)
        map('n', '<leader>cs', gs.stage_hunk)
        map('n', '<leader>cS', gs.stage_buffer)
        map('n', '<leader>cr', gs.reset_hunk)
        map('n', '<leader>cR', gs.reset_buffer)
        map('n', '<leader>cd', gs.diffthis)
        map('n', '<leader>cD', function() gs.diffthis '~' end)
      end,
    },
  },

  {
    'sindrets/diffview.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    cmd = {
      'DiffviewOpen',
      'DiffviewClose',
      'DiffviewToggleFiles',
      'DiffviewFocusFiles',
      'DiffviewRefresh',
      'DiffviewFileHistory',
    },
    keys = {
      { '<leader>ds', '<cmd>DiffviewOpen<cr>' },
      { '<leader>dh', '<cmd>DiffviewFileHistory<cr>' },
      { '<leader>dH', '<cmd>DiffviewFileHistory %<cr>' },
      { '<leader>dc', '<cmd>DiffviewClose<cr>' },
    },
    config = function()
      local actions = require 'diffview.actions'
      require('diffview').setup {
        use_icons = false,
        view = {
          merge_tool = {
            layout = 'diff3_mixed',
          },
        },
        keymaps = {
          file_panel = {
            { 'n', 'a',         actions.toggle_stage_entry },
            { 'n', 'A',         actions.stage_all },
            { 'n', 'u',         actions.toggle_stage_entry },
            { 'n', 'U',         actions.unstage_all },
            { 'n', '<leader>e', '<cmd>DiffviewToggleFiles<cr>' },
          },
          file_history_panel = {
            { 'n', '<leader>e', '<cmd>DiffviewToggleFiles<cr>' },
          },
        },
      }
    end,
  },

  {
    -- dir = '~/dev/personal/diffstore.nvim',
    'tkachenko0/diffstore.nvim',
  },
}
