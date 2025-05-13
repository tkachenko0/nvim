local current_source_index = 1
local sources = { "filesystem", "buffers", "git_status" }

local function cycle_neo_tree_source(state)
  current_source_index = current_source_index % #sources + 1
  local source = sources[current_source_index]
  require("neo-tree.command").execute({
    source = source,
    toggle = false,
    reveal = true,
  })
end

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",           -- Required for neo-tree
    "nvim-tree/nvim-web-devicons",     -- Optional, but provides file icons
    "MunifTanjim/nui.nvim",            -- Required for neo-tree UI
  },
  cmd = "Neotree",
  keys = {
    { "<leader>e", "<cmd>Neotree filesystem reveal toggle<CR>", desc = "Toggle Filesystem Tree" },
    { "<leader>b", "<cmd>Neotree buffers reveal toggle right<CR>", desc = "Toggle Buffers Tree" },
    { "<leader>gs", "<cmd>Neotree git_status reveal toggle left<CR>", desc = "Toggle Git Status View" },
  },
  config = function()
    require("neo-tree").setup({
      sources = { "filesystem", "buffers", "git_status" },
      source_selector = {
        winbar = true,
        sources = {
          { source = "filesystem", display_name = "󰉓 Files" },
          { source = "buffers",    display_name = "󰈚 Buffers" },
          { source = "git_status", display_name = "󰊢 Git" },
        },
      },
      window = {
        position = "left",
        mappings = {
          ["<cr>"] = "open",
          ["<Right>"] = "open",
          ["<Left>"] = "close_node",
          ["<Tab>"] = cycle_neo_tree_source,
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
        },
        filtered_items = {
          visible = true,
          show_hidden_count = true,
          hide_dotfiles = false,
          hide_gitignored = false,
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

