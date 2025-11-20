return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lua",
    },
    event = "InsertEnter",
    config = function()
        local cmp = require("cmp")
        cmp.setup({
            preselect = cmp.PreselectMode.Item,
            completion = {
                completeopt = 'menu,menuone,noinsert',
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            snippet = {
                expand = function(args)
                end,
            },
            mapping = {
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<Down>"] = cmp.mapping.select_next_item(),
                ["<Up>"] = cmp.mapping.select_prev_item(),
            },
            sources = {
                { name = "nvim_lsp" },
                { name = "buffer" },
                { name = "nvim_lua" },
                { name = "path" },
                { name = "calc" },
            },
        })
    end,
}
