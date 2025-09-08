require("viacheslav.core.set")
require("viacheslav.core.remap")

vim.api.nvim_create_autocmd('TextYankPost', {
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 200,
        })
    end,
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(e)
        local opts = { buffer = e.buf }
        local client = vim.lsp.get_client_by_id(e.data.client_id)

        -- Definition
        if client.name == "omnisharp" then
            vim.keymap.set("n", "gd", function()
                require("omnisharp_extended").lsp_definition()
            end, opts)
        else
            vim.keymap.set("n", "gd", function()
                vim.lsp.buf.definition()
            end, opts)
        end

        -- Other keymaps (shared across all LSPs)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover { border = "single" } end, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "[D", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]D", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "[d", function()
            vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
        end, opts)
        vim.keymap.set("n", "]d", function()
            vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
        end, opts)
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "yaml",
    callback = function()
        vim.opt_local.cursorcolumn = true
    end,
})
