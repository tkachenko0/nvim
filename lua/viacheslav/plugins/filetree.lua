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
    -- { "<leader>e", "<cmd>Neotree filesystem reveal toggle<CR>" },
    { "\\",         "<cmd>Neotree filesystem reveal toggle<CR>" },
    { "<leader>ts", "<cmd>Neotree document_symbols toggle<CR>" }, -- Added shortcut for document symbols
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,

      sources = {
        "filesystem",
        "buffers",
        "git_status",
        -- "document_symbols",
      },

      source_selector = {
        winbar = true,
        tabs_layout = "stacked",
        sources = {
          { source = "filesystem", display_name = "󰉓 Files" },
          { source = "buffers", display_name = "󰈚 Buffers" },
          { source = "git_status", display_name = "󰊢 Git" },
          -- { source = "document_symbols", display_name = "󰈹 Symbols" },
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
        position = "left",
        auto_expand_width = true,
        -- width = 35,
        mappings = {
          ["<cr>"] = "open",
          ["<Tab>"] = "next_source",
          ["<Right>"] = "toggle_node",
          ["<Left>"] = "close_node",
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
            ["A"] = "git_add_all",
            ["a"] = "git_add_file",
            ["u"] = "git_unstage_file",
            ["r"] = "git_revert_file",
            ["c"] = "git_commit",
            ["p"] = "git_push",
            ["gg"] = "git_commit_and_push",
          },
        },
      },

      -- document_symbols = {
      --   follow_current_file = {
      --     enabled = true,
      --   },
      -- },

    })

    vim.api.nvim_set_hl(0, "NeoTreeGitIgnored", { fg = "#6A6A6A", italic = true })
    vim.api.nvim_set_hl(0, "NeoTreeHidden", { fg = "#6A6A6A", italic = true })
  end,
}
