return {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo', 'AutoformatDisable', 'AutoformatEnable' },
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
        format_on_save = function(bufnr)
            -- You can store disabled buffers in a table if needed for fine-grained control
            return not vim.g.autoformat_disabled
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

        -- Global flag for autoformat
        vim.g.autoformat_disabled = false

        -- Toggle commands
        vim.api.nvim_create_user_command("AutoformatDisable", function()
            vim.g.autoformat_disabled = true
            print("Autoformat on save: Disabled")
        end, {})

        vim.api.nvim_create_user_command("AutoformatEnable", function()
            vim.g.autoformat_disabled = false
            print("Autoformat on save: Enabled")
        end, {})
    end,
}
