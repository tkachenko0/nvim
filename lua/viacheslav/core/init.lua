require("viacheslav.core.set")
require("viacheslav.core.remap")

local augroup = vim.api.nvim_create_augroup
local ThePrimeagenGroup = augroup('ThePrimeagen', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

vim.filetype.add({
    extension = {
        templ = 'templ',
    }
})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd('LspAttach', {
    group = ThePrimeagenGroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        -- vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)


        -- Set keymap for hover
        vim.keymap.set("n", "K", function()
          vim.lsp.buf.hover()
        end, { noremap = true, silent = true })

        -- Customize hover window appearance (rounded border and size)
        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
          vim.lsp.handlers.hover, {
            border = "rounded",  -- Adds rounded corners
            width = 60,          -- Set a maximum width for the hover window
            height = 20,         -- Set a maximum height for the hover window
          }
        )

        -- Custom highlight for hover window
        vim.api.nvim_set_hl(0, "LspFloatWinNormal", { bg = "#1e1e1e", fg = "#ffffff" })
        vim.api.nvim_set_hl(0, "LspFloatWinBorder", { fg = "#ff8c00" })

        -- Optional: Position the hover window relative to the cursor
        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
          vim.lsp.handlers.hover, {
            relative = "cursor",   -- Position relative to cursor
            row = 1,               -- Set row offset
            col = 0,               -- Adjust the column offset
          }
        )

    end
})
