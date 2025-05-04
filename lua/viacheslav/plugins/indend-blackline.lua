return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    indent = { char = "·" }, -- Or use "│" or other
    whitespace = {
      remove_blankline_trail = false
    },
    scope = {
      enabled = true, -- turn on to show scope guides
    },
  }
}


