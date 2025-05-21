return {
  "hedyhli/outline.nvim",
  config = function()
    require("outline").setup {
      outline_window = {
        position = "right", -- or "left"
        width = 35,         -- default is 30
      },
      symbols = {
        -- You can filter or customize symbols shown here
        -- Example:
        -- filter = { "Function", "Class", "Method" }
      },
      auto_close = false,   -- Keeps it open
      auto_jump = false,    -- Don't auto-jump to symbols
      auto_preview = false, -- Prevent preview window popping up
    }

    -- Toggle outline with <leader>a
    vim.keymap.set("n", "<leader>a", "<cmd>Outline<CR>", { desc = "Toggle Outline" })
  end,
}
