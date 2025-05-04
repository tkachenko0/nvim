return {
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup({
                sort_by = "case_sensitive",
                view = {
                    width = 35,
                    side = "left",
                    preserve_window_proportions = true,
                    number = false,
                    relativenumber = false,
                    signcolumn = "yes",
                    adaptive_size = true,
                },
                renderer = {
                    group_empty = true,
                    highlight_git = true,
                    highlight_opened_files = "name",
                    root_folder_label = ":~:s?$?/..?",
                    indent_markers = {
                        enable = true,
                    },
                    icons = {
                        glyphs = {
                            default = "",
                            symlink = "",
                            folder = {
                                arrow_closed = "",
                                arrow_open = "",
                                default = "",
                                open = "",
                                empty = "",
                                empty_open = "",
                                symlink = "",
                                symlink_open = "",
                            },
                            git = {
                                unstaged = "✗",
                                staged = "✓",
                                unmerged = "",
                                renamed = "➜",
                                untracked = "★",
                                deleted = "",
                                ignored = "◌",
                            },
                        },
                    },
                },
                filters = {
                    dotfiles = false,
                    custom = {},
                },
                git = {
                    enable = true,
                    ignore = false,
                },
                diagnostics = {
                    enable = true,
                    show_on_dirs = true,
                    icons = {
                        hint = "",
                        info = "",
                        warning = "",
                        error = "",
                    },
                },
                actions = {
                    open_file = {
                        resize_window = true,
                    },
                },
                update_focused_file = {
                    enable = true,
                    update_cwd = true,
                },
            })
        end,
    },
}
