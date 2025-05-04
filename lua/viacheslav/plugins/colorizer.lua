return {
    "norcalli/nvim-colorizer.lua",  -- Colorizer plugin
    config = function()
        -- Set up colorizer for all filetypes
        require("colorizer").setup({
            "*",  -- Apply to all filetypes
            css = { rgb_fn = true },  -- Support RGB functions in CSS
            html = { names = true },  -- Support color names in HTML
        })

        -- Optionally, bind a key to toggle colorizer
        vim.api.nvim_set_keymap('n', '<leader>tc', ':ColorizerToggle<CR>', { noremap = true, silent = true })
    end
}

