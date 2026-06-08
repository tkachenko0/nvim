return {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'MunifTanjim/nui.nvim',
    },
    cmd = 'Neotree',
    config = function()
        require('neo-tree').setup {
            default_component_configs = {
                -- expander ASCII al posto delle chevron del nerd font
                indent = {
                    with_expanders = true,
                    expander_collapsed = '>',
                    expander_expanded = 'v',
                },
                -- niente glifi del font per file/cartelle
                icon = {
                    folder_closed = '',
                    folder_open = '',
                    folder_empty = '',
                    default = '',
                    highlight = 'NeoTreeFileIcon',
                },
                -- "/" finale per indicare che è una cartella
                name = {
                    trailing_slash = true,
                    use_git_status_colors = true,
                },
                -- stato git in versione testuale (no nerd font)
                git_status = {
                    symbols = {
                        added = 'A',
                        modified = 'M',
                        deleted = 'D',
                        renamed = 'R',
                        untracked = '?',
                        ignored = 'I',
                        unstaged = 'U',
                        staged = 'S',
                        conflict = 'C',
                    },
                },
            },
            window = {
                mappings = {
                    ['<cr>'] = 'open',
                    ['<Tab>'] = 'next_source',
                    ['l'] = 'toggle_node',
                    ['h'] = 'close_node',
                },
            },
            filesystem = {
                follow_current_file = {
                    enabled = true,
                    leave_dirs_open = true,
                },
                filtered_items = {
                    visible = true,
                    show_hidden_count = true,
                    hide_dotfiles = false,
                    hide_gitignored = false,
                },
                use_libuv_file_watcher = true,
            },
        }
    end,
}
