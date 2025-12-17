return {
    -- {
    --
    --     "nvim-lua/plenary.nvim",
    --     config = function()
    --         _G.statusline = function()
    --             local bufnr = vim.api.nvim_get_current_buf()
    --             local errors = #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.ERROR })
    --             local warnings = #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.WARN })
    --             local info = #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.INFO })
    --             local hints = #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.HINT })
    --
    --             local diag = ""
    --             if errors > 0 then diag = diag .. "%#DiagnosticError# E:" .. errors .. "%*" end
    --             if warnings > 0 then diag = diag .. "%#DiagnosticWarn# W:" .. warnings .. "%*" end
    --             if info > 0 then diag = diag .. "%#DiagnosticInfo# I:" .. info .. "%*" end
    --             if hints > 0 then diag = diag .. "%#DiagnosticHint# H:" .. hints .. "%*" end
    --
    --             return diag
    --         end
    --
    --         local branch = vim.fn.system("git branch --show-current 2>/dev/null | tr -d '\n'")
    --         if branch ~= "" then branch = "%#Identifier# " .. branch .. " %*" end
    --
    --         vim.o.statusline = branch .. "%<%t %m %{%v:lua.statusline()%}%="
    --
    --         vim.api.nvim_create_autocmd({ "DiagnosticChanged", "BufEnter", "LspAttach" }, {
    --             callback = function() vim.cmd("redrawstatus") end,
    --         })
    --
    --         vim.diagnostic.config({
    --             update_in_insert = false,
    --         })
    --     end,
    -- },

    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup {
                options = {
                    section_separators = { left = '', right = '' },
                    component_separators = { left = '', right = '' },
                },
                sections = {
                    lualine_a = {
                    },
                    lualine_b = {
                        'branch',
                    },
                    lualine_c = {
                        'filename',
                        {
                            'diagnostics',
                            right_padding = 0,
                        },
                    },
                    lualine_x = {
                        'diff',
                    },
                    lualine_y = {
                        'filetype',
                    },
                    lualine_z = {},
                },
                extensions = { 'fugitive' },
            }
        end
    }
}
