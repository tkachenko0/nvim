return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",       -- Required for neo-tree
      "nvim-tree/nvim-web-devicons", -- Optional, but provides file icons
      "MunifTanjim/nui.nvim",        -- Required for neo-tree UI
    },
    cmd = "Neotree",
    keys = {
      { "<leader>e", "<cmd>Neotree filesystem reveal toggle<CR>" },
      { "<leader>b", "<cmd>Neotree buffers reveal toggle<CR>" },
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = false,
        sources = { "filesystem", "buffers", "git_status" },
        source_selector = {
          winbar = true,
          tabs_layout = "stacked",
          sources = {
            { source = "filesystem", display_name = "󰉓 Files" },
            { source = "buffers", display_name = "󰈚 Buffers" },
            { source = "git_status", display_name = "󰊢 Git" },
          },
        },
        default_component_configs = {
          git_status = {
            symbols = {
              ignored = "◌",
            },
          },
          indent = {
            with_markers = false,
          },
        },
        window = {
          position = "right",
          mappings = {
            ["<cr>"] = "open",
            ["<Right>"] = "open",
            ["<Left>"] = "close_node",
            ["<Tab>"] = "next_source",
            ["P"] = {
              "toggle_preview",
              config = {
                use_float = false,
                use_image_nvim = true,
                title = 'Neo-tree Preview',
              },
            },
          },
        },
        buffers = {
          follow_current_file = {
            enabled = true,
          },
          show_hidden = true,
        },
        filesystem = {
          follow_current_file = {
            enabled = true,
            leave_dirs_open = true,
            -- auto_expand_directories = false,
          },
          filtered_items = {
            visible = true,
            show_hidden_count = true,
            hide_dotfiles = false,
            hide_gitignored = false,
            never_show = {
              ".git",
              ".DS_Store",
              "__pycache__",
            },
          },
          use_libuv_file_watcher = true,
        },
        git_status = {
          follow_current_file = {
            enabled = false,
          },
          window = {
            mappings = {
            },
          },
        },
      })
    end,
  },

  -- {
  --   {
  --     "nvim-tree/nvim-tree.lua",
  --     dependencies = {
  --       "nvim-tree/nvim-web-devicons",
  --     },
  --     config = function()
  --       local function on_attach(bufnr)
  --         local api = require("nvim-tree.api")
  --         local opts = function(desc)
  --           return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  --         end
  --         api.config.mappings.default_on_attach(bufnr)
  --         vim.keymap.set("n", "<Right>", api.node.open.edit, opts("Open Node"))
  --         vim.keymap.set("n", "<Left>", api.node.navigate.parent_close, opts("Close Parent Node"))
  --       end
  --       require("nvim-tree").setup({
  --         sort_by = "case_sensitive",
  --         view = {
  --           width = 35,
  --           side = "left",
  --           adaptive_size = true,
  --           preserve_window_proportions = true,
  --           number = false,
  --           relativenumber = false,
  --           signcolumn = "yes",
  --         },
  --         renderer = {
  --           group_empty = true,
  --           root_folder_label = false,
  --           highlight_git = true,
  --           indent_markers = {
  --             enable = true,
  --           },
  --           icons = {
  --             glyphs = {
  --               default = "󰈚",
  --               folder = {
  --                 default = "",
  --                 empty = "",
  --                 empty_open = "",
  --                 open = "",
  --                 symlink = "",
  --               },
  --               git = { unmerged = "" },
  --             },
  --           },
  --         },
  --         filters = {
  --           dotfiles = false,
  --           custom = {},
  --         },
  --         git = {
  --           enable = true,
  --           ignore = false,
  --         },
  --         actions = {
  --           open_file = {
  --             resize_window = true,
  --           },
  --         },
  --         update_focused_file = {
  --           enable = true,
  --           update_cwd = true,
  --         },
  --         on_attach = on_attach,
  --       })
  --     end,
  --   },
  -- }
  --
  --
}
