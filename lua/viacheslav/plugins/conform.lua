return {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = {
        'ConformInfo',
        'FormatEnable',
        'FormatDisable',
    },
    keys = {
        {
            "<leader>f",
            function()
                require("conform").format({ async = true, lsp_fallback = true })
            end,
            desc = "Format file",
        },
    },
    opts = {
        notify_on_error = false,
        format_on_save = function()
            return vim.g.autoformat_enabled
                and {
                    timeout_ms = 3000,
                    lsp_fallback = true,
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
    config = function(_, opts)
        require("conform").setup(opts)

        vim.g.autoformat_enabled = true

        vim.api.nvim_create_user_command("FormatDisable", function()
            vim.g.autoformat_enabled = false
            print("Autoformat on save: Disabled")
        end, {})

        vim.api.nvim_create_user_command("FormatEnable", function()
            vim.g.autoformat_enabled = true
            print("Autoformat on save: Enabled")
        end, {})
    end,
}
