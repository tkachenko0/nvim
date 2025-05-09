return { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { -- If encountering errors, see telescope-fzf-native README for installation instructions
            'nvim-telescope/telescope-fzf-native.nvim',

            -- `build` is used to run some command when the plugin is installed/updated.
            -- This is only run then, not every time Neovim starts up.
            build = 'make',

            -- `cond` is a condition used to determine whether this plugin should be
            -- installed and loaded.
            cond = function()
                return vim.fn.executable 'make' == 1
            end,
        },
        { 'nvim-telescope/telescope-ui-select.nvim' },

        -- Useful for getting pretty icons, but requires a Nerd Font.
        { 'nvim-tree/nvim-web-devicons',            enabled = vim.g.have_nerd_font },
    },
    config = function()
        -- Telescope is a fuzzy finder that comes with a lot of different things that
        -- it can fuzzy find! It's more than just a "file finder", it can search
        -- many different aspects of Neovim, your workspace, LSP, and more!
        --
        -- The easiest way to use Telescope, is to start by doing something like:
        --  :Telescope help_tags
        --
        -- After running this command, a window will open up and you're able to
        -- type in the prompt window. You'll see a list of `help_tags` options and
        -- a corresponding preview of the help.
        --
        -- Two important keymaps to use while in Telescope are:
        --  - Insert mode: <c-/>
        --  - Normal mode: ?
        --
        -- This opens a window that shows you all of the keymaps for the current
        -- Telescope picker. This is really useful to discover what Telescope can
        -- do as well as how to actually do it!

        -- [[ Configure Telescope ]]
        -- See `:help telescope` and `:help telescope.setup()`
        require('telescope').setup {
            -- You can put your default mappings / updates / etc. in here
            --  All the info you're looking for is in `:help telescope.setup()`
            --

            defaults = {
                path_display = { "smart" },
                -- mappings = {
                --   i = { ['<c-enter>'] = 'to_fuzzy_refine' },
                -- },
            },
            -- pickers = {}
            extensions = {
                ['ui-select'] = {
                    require('telescope.themes').get_dropdown(),
                },
            },
        }

        -- Enable Telescope extensions if they are installed
        pcall(require('telescope').load_extension, 'fzf')
        pcall(require('telescope').load_extension, 'ui-select')

        -- See `:help telescope.builtin`
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
        vim.keymap.set("n", "<leader>fr", "<cmd>Telescope lsp_references<CR>", opts)
        vim.keymap.set('n', '<leader>/', function() builtin.current_buffer_fuzzy_find() end, { desc = '[/] Fuzzily search in current buffer' })
        vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
end,
}
