return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  cmd = "Neotree",
  keys = {
    { "<leader>\\", "<cmd>Neotree filesystem reveal toggle<CR>" },
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = false,
      hide_root_node = true,
      log_level = "error",
      sources = {
        "filesystem",
        "buffers",
      },
      source_selector = {
        winbar = false,
        tabs_layout = "equal",
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
        name = {
          highlight = "NeoTreeFileName",
          use_git_status_colors = true,
        },
      },
      window = {
        mappings = {
          ["<cr>"] = "open",
          ["<Tab>"] = "next_source",
          ["<Right>"] = "toggle_node",
          ["<Left>"] = "close_node",
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
          never_show = {
            ".git",
            ".DS_Store",
            "__pycache__",
          },
        },
        use_libuv_file_watcher = true,
      },
      buffers = {
        follow_current_file = {
          enabled = true,
        },
        show_hidden = true,
      },
    })
    vim.api.nvim_set_hl(0, "NeoTreeGitIgnored", { fg = "#6A6A6A", italic = true })
    vim.api.nvim_set_hl(0, "NeoTreeHidden", { fg = "#6A6A6A", italic = true })
  end,
}
