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
            file_status = true,
            path = 0 -- 0 = just filename, 1 = relative path, 2 = absolute path
        }

        local function git_ahead_behind()
            local handle = io.popen("git rev-list --count --left-right @{upstream}...HEAD 2>/dev/null")
            if not handle then return "" end
            local result = handle:read("*a")
            handle:close()
            if result == "" then return "" end
            local behind, ahead = result:match("(%d+)%s+(%d+)")
            if not behind or not ahead then return "" end
            local output = ""
            if tonumber(behind) > 0 then
                output = output .. "↓" .. behind
            end
            if tonumber(ahead) > 0 then
                if output ~= "" then output = output .. " " end
                output = output .. "↑" .. ahead
            end
            if output ~= "" then
                output = " " .. output .. "%#lualine_b_normal#"
            end
            return output
        end

        local branch_config = {
            'branch',
            fmt = function(str)
                return str .. git_ahead_behind()
            end
        }

        require("lualine").setup {
            options = {
                icons_enabled = true,
                theme = 'vscode',
                section_separators = { left = '', right = '' },
                component_separators = { left = '', right = '' },
                disabled_filetypes = {}
            },
            sections = {
                lualine_a = {},
                lualine_b = { branch_config },
                lualine_c = { filename_config },
                lualine_x = { diagnostics_config, 'filetype' },
                lualine_y = {},
                lualine_z = {}
            },
            inactive_sections = {
                -- lualine_a = {},
                lualine_b = {},
                lualine_c = {
                    {
                        'filename',
                        file_status = true,
                        path = 1
                    }
                },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            extensions = { 'fugitive' }
        }

        local timer = vim.loop.new_timer()
        timer:start(0, 300000, vim.schedule_wrap(function()
            local handle = io.popen("git rev-parse --is-inside-work-tree 2>/dev/null")
            if handle then
                local result = handle:read("*a")
                handle:close()
                if result:match("true") then
                    vim.fn.jobstart("git fetch", {
                        on_exit = function()
                            require('lualine').refresh()
                        end
                    })
                end
            end
        end))
    end
}
