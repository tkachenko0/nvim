return {
    "norcalli/nvim-colorizer.lua",  -- Colorizer plugin
    config = function()
        require("colorizer").setup({
            "*",  -- Apply to all filetypes
            css = { rgb_fn = true },  -- Support RGB functions in CSS
            html = { names = true },  -- Support color names in HTML
        })
    end
}

