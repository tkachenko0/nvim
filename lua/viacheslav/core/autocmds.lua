vim.api.nvim_create_autocmd('TextYankPost', {
    pattern = '*',
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover { border = "single" } end, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "[D", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]D", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR }) end,
            opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR }) end,
            opts)
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "yaml",
    callback = function()
        vim.opt_local.cursorcolumn = true
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.wo.wrap = true
        vim.wo.linebreak = true
    end,
})
