return {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = function()
                return vim.fn.executable 'make' == 1
            end,
        },
        { 'nvim-telescope/telescope-ui-select.nvim' },
        { 'nvim-tree/nvim-web-devicons',            enabled = vim.g.have_nerd_font },
    },
    config = function()
        require('telescope').setup {
            defaults = {
                -- prompt_prefix = "   ",
                path_display = { "smart" },
                mappings = {
                    i = { -- Insert mode mappings
                        ["<C-q>"] = require('telescope.actions').send_to_qflist + require('telescope.actions').open_qflist,
                    },
                    n = { -- Normal mode mappings
                        ["<C-q>"] = require('telescope.actions').send_to_qflist + require('telescope.actions').open_qflist,
                    },
                },

            },
            extensions = {
                ['ui-select'] = {
                    require('telescope.themes').get_dropdown(),
                },
            },
        }

        pcall(require('telescope').load_extension, 'fzf')
        pcall(require('telescope').load_extension, 'ui-select')

        local builtin = require 'telescope.builtin'
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[S]earch [F]iles' })
        vim.keymap.set('n', '<C-p>', function()
            local is_git_repo = vim.fn.system('git rev-parse --is-inside-work-tree 2>/dev/null') == 'true\n'
            if is_git_repo then
                -- If inside a Git repo, use the original behavior (search Git files)
                require('telescope.builtin').git_files()
            else
                -- If not inside a Git repo, search files across all folders
                require('telescope.builtin').find_files({ cwd = vim.fn.expand('%:p:h') })
            end
        end, { desc = '[S]earch [F]iles (Git or all folders)' })

        vim.keymap.set('n', '<leader>fr', require('telescope.builtin').lsp_references, { desc = '[G]o to [R]eferences' })
        vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
        vim.keymap.set('n', '<leader>fG', function()
            require('telescope.builtin').live_grep {
                additional_args = function()
                    return { '--case-sensitive' }
                end,
            }
        end, { desc = '[S]earch by [G]rep (match case)' })
        vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
        vim.keymap.set('n', '<leader>/', function() builtin.current_buffer_fuzzy_find() end,
            { desc = '[/] Fuzzily search in current buffer' })
        vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
    end,
}
