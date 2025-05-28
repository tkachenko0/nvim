return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lua",
    },
    event = "InsertEnter",
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        cmp.setup({
            completion = {
                completeopt = 'menu,menuone,noinsert',
            },
            window = {
                completion = {
                    border = "rounded",
                },
                documentation = {
                    border = "rounded",
                },
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },

            mapping = {
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
            },
            preselect = cmp.PreselectMode.Item,

            sources = {
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "buffer" },
                { name = "nvim_lua" },
                { name = "path" },
                { name = "calc" },
            },
        })
    end,
}
