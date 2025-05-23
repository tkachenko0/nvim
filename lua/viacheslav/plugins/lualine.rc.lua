-- function _G.GitBranch()
--     local handle = io.popen("git -C " .. vim.fn.expand("%:p:h") .. " rev-parse --abbrev-ref HEAD 2>/dev/null")
--     if handle then
--         local branch = handle:read("*l")
--         handle:close()
--         return branch and " " .. branch or ""
--     end
--     return ""
-- end
--
-- local signs = { error = ' ', warn = ' ', info = ' ', hint = ' ' }
--
-- function Diagnostics()
--     local bufnr = 0 -- current buffer
--     local result = {}
--
--     for type, icon in pairs(signs) do
--         local n = #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity[type:upper()] })
--         if n > 0 then
--             table.insert(result, icon .. n)
--         end
--     end
--
--     return table.concat(result, ' ')
-- end
--
-- vim.o.statusline =
--     "%{v:lua.GitBranch()}    " .. -- Git branch
--     "%<%f %m%r" ..                -- File path and flags
--     "%=" ..                       -- Right align
--     -- "%l:%c " ..                   -- Line, Column (optional)
--     " %{v:lua.Diagnostics()} " .. -- Diagnostics
--     "%y"                          -- Filetype


-- return {}
return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local diagnostics_config = {
            'diagnostics',
            sources = { "nvim_diagnostic" },
            symbols = {
                error = ' ', warn = ' ', info = ' ', hint = ' '
            }
        }
        local filename_config = {
            'filename',
            file_status = true, -- shows file status (readonly, modified)
            path = 0            -- 0 = just filename, 1 = relative path, 2 = absolute path
        }
        require("lualine").setup {
            options = {
                icons_enabled = true,
                theme = 'vscode',
                section_separators = { left = '', right = '' },
                component_separators = { left = '', right = '' },
                disabled_filetypes = {}
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch' },
                lualine_c = { filename_config },
                lualine_x = { diagnostics_config, 'encoding', 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {
                    {
                        'filename',
                        file_status = true,
                        path = 1 -- Show relative path in inactive sections
                    }
                },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            extensions = { 'fugitive' }
        }
    end
}
