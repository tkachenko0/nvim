return {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {},
    opts = {
        notify_on_error = false,
        format_on_save = function()
            return {
                timeout_ms = 3000,
                lsp_format = 'fallback',
            }
        end,
        formatters_by_ft = {
            javascript = { "prettier" },
            typescript = { "prettier" },
            javascriptreact = { "prettier" },
            typescriptreact = { "prettier" },
            htmlangular = { "prettier" },
            svelte = { "prettier" },
            css = { "prettier" },
            html = { "prettier" },
            json = { "prettier" },
            yaml = { "prettier" },
            markdown = { "prettier" },
            graphql = { "prettier" },
            liquid = { "prettier" },
            lua = {},
            python = { "isort", "black" },
        },
    },
}
