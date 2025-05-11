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
                    adaptive_size = true,
                    preserve_window_proportions = true,
                    number = false,
                    relativenumber = false,
                    signcolumn = "yes",
                },
                renderer = {
                    group_empty = true,
                    root_folder_label = false,
                    highlight_git = true,
                    indent_markers = {
                        enable = true,
                    },
                    icons = {
                      glyphs = {
                        default = "󰈚",
                        folder = {
                          default = "",
                          empty = "",
                          empty_open = "",
                          open = "",
                          symlink = "",
                        },
                        git = { unmerged = "" },
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
