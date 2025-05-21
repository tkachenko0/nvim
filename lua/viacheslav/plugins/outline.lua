return {
  "stevearc/aerial.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>a", "<cmd>AerialToggle!<CR>", desc = "Toggle Aerial outline" },
  },
  opts = {
    lazy_load = true,
    on_attach = function(bufnr)
      vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr, desc = "Previous symbol" })
      vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr, desc = "Next symbol" })
    end,
    backends = { "treesitter", "lsp", "markdown", "asciidoc", "man" },
    layout = {
      default_direction = "prefer_right",
    },
    attach_mode = "global",
    highlight_mode = "split_width",
    highlight_closest = true,
    highlight_on_hover = true,
    highlight_on_jump = 300,
    show_guides = true,
    float = {
      border = "rounded",
      relative = "cursor",
    },
  },
}
