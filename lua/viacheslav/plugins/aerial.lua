return {
  "stevearc/aerial.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>a", "<cmd>AerialToggle!<CR>", desc = "Toggle Aerial outline" },
    { "{",         "<cmd>AerialPrev<CR>",    desc = "Aerial: Previous symbol" },
    { "}",         "<cmd>AerialNext<CR>",    desc = "Aerial: Next symbol" },
  },
  opts = {
    on_attach = function(bufnr)
      vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr, desc = "Aerial: Previous symbol" })
      vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr, desc = "Aerial: Next symbol" })
    end,
    backends = { "treesitter", "lsp", "markdown", "asciidoc", "man" },
    layout = {
      max_width = { 40, 0.2 },
      min_width = 10,
      default_direction = "prefer_right",
      placement = "window",
      resize_to_content = true,
      preserve_equality = false,
    },
    attach_mode = "window",
    close_automatic_events = {},
    lazy_load = true,
    disable_max_lines = 10000,
    disable_max_size = 2000000,
    filter_kind = {
      "Class",
      "Constructor",
      "Enum",
      "Function",
      "Interface",
      "Module",
      "Method",
      "Struct",
    },
    highlight_mode = "split_width",
    highlight_closest = true,
    highlight_on_hover = false,
    highlight_on_jump = 300,
  },
}
