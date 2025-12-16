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
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
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

local session_dir = vim.fn.stdpath("data") .. "/sessions"
vim.fn.mkdir(session_dir, "p")

local function project_root()
    local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
    if vim.v.shell_error == 0 then
        return git_root
    end
    return vim.fn.getcwd()
end

local function session_name()
    return session_dir
        .. "/"
        .. project_root():gsub("/", "%%")
        .. ".vim"
end

-- Save session on exit
vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
        vim.cmd("mksession! " .. vim.fn.fnameescape(session_name()))
    end,
})

-- Load session AFTER startup is complete
vim.api.nvim_create_autocmd("VimEnter", {
    once = true,
    callback = function()
        local session = session_name()
        if vim.fn.filereadable(session) == 1 then
            vim.schedule(function()
                vim.cmd("source " .. vim.fn.fnameescape(session))
            end)
        end
    end,
})
