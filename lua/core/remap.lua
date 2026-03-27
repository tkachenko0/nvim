vim.g.mapleader = ' '

local set = vim.keymap.set

set("n", "<C-j>", "<c-w><c-j>")
set("n", "<C-k>", "<c-w><c-k>")
set("n", "<C-l>", "<c-w><c-l>")
set("n", "<C-h>", "<c-w><c-h>")

set('v', '<A-j>', ":m '>+1<CR>gv=gv")
set('v', '<A-k>', ":m '<-2<CR>gv=gv")
set('n', '<A-j>', ':m .+1<CR>==')
set('n', '<A-k>', ':m .-2<CR>==')

set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

set('n', '<leader>q', function()
    for _, win in ipairs(vim.fn.getwininfo()) do
        if win.quickfix == 1 then
            vim.cmd('cclose')
            return
        end
    end
    vim.cmd('copen')
end)

set('n', '[D', vim.diagnostic.goto_prev)
set('n', ']D', vim.diagnostic.goto_next)
set('n', '[d', function() vim.diagnostic.goto_prev { severity = vim.diagnostic.severity.ERROR } end)
set('n', ']d', function() vim.diagnostic.goto_next { severity = vim.diagnostic.severity.ERROR } end)

set({ 'n', 'v' }, 'y', '"+y')
set({ 'n', 'v' }, '<leader>p', '"+p')
set({ 'n', 'v' }, '<leader>c', '"+c')

set('v', '<', '<gv')
set('v', '>', '>gv')
set('n', '>', '>>')
set('n', '<', '<<')

set('n', '<Tab>', '<C-6>')
set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(e)
        local opts = { buffer = e.buf }
        set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
        set('n', 'K', function() vim.lsp.buf.hover { border = 'single' } end, opts)
        set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        set('n', 'gr', vim.lsp.buf.references, opts)
        set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    end,
})
