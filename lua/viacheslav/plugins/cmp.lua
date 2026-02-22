return {
    "saghen/blink.cmp",
    dependencies = "rafamadriz/friendly-snippets",
    version = "*",
    opts = {
        keymap = {
            preset = "default",
            ["<CR>"] = { "accept", "fallback" },
            ["<Tab>"] = { "select_next", "fallback" },
            ["<S-Tab>"] = { "select_prev", "fallback" },
        },
        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = "mono",
        },
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
            per_filetype = {
                sql = { 'snippets', 'dadbod', 'buffer' },
            },
            providers = {
                dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
            },
        },
        completion = {
            menu = {
                border = "rounded",
            },
            documentation = {
                window = {
                    border = "rounded",
                },
                auto_show = true,
            },
        },
        signature = {
            enabled = true,
        },
    },
}
