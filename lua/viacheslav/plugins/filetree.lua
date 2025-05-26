return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",       -- Required for neo-tree
    "nvim-tree/nvim-web-devicons", -- Optional, but provides file icons
    "MunifTanjim/nui.nvim",        -- Required for neo-tree UI
  },
  cmd = "Neotree",
  keys = {
    { "<leader>e", "<cmd>Neotree filesystem reveal toggle<CR>" }
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
        position = "left",
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
}
