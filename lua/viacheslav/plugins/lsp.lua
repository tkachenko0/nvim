return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim"
    },

    config = function()
        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )

        -- Fidget (LSP Progress Indicator)
        require("fidget").setup()

        -- Mason (Install LSP servers automatically)
        require("mason").setup({
            ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
        })

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(e)
                local opts = { buffer = e.buf }
                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
                vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
                vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
                vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
                vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
                vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
                vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
                vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
                vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)

				-- set keybinds
				-- opts.desc = "Show LSP references"
				-- keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references
				--
				-- opts.desc = "Go to declaration"
				-- keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration
				--
				-- opts.desc = "Show LSP definitions"
				-- keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions
				--
				-- opts.desc = "Show LSP implementations"
				-- keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations
				--
				-- opts.desc = "Show LSP type definitions"
				-- keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions
				--
				-- opts.desc = "See available code actions"
				-- keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection
				--
				-- opts.desc = "Smart rename"
				-- keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename
				--
				-- opts.desc = "Show buffer diagnostics"
				-- keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
				--
				-- opts.desc = "Show line diagnostics"
				-- keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line
				--
				-- opts.desc = "Go to previous diagnostic"
				-- keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer
				--
				-- opts.desc = "Go to next diagnostic"
				-- keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer
				--
				-- opts.desc = "Show documentation for what is under cursor"
				-- keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
			end,
		})

        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "ts_ls",
                "cssls",
                "html",
                "angularls",
                "pyright",
            },
            handlers = {
                -- General handler for all LSP servers
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        capabilities = capabilities,
                    })
                end,
                -- Custom handler for specific servers (like lua_ls and pyright)
                ["lua_ls"] = function()
                    require("lspconfig").lua_ls.setup({
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim", "it", "describe", "before_each", "after_each" },
                                },
                            },
                        },
                    })
                end,
                ["pyright"] = function()
                    local lspconfig = require("lspconfig")
                    local util = require("lspconfig/util")

                    lspconfig.pyright.setup({
                        capabilities = capabilities,
                        settings = {
                            python = {
                                analysis = {
                                    reportMissingImports = "error",
                                },
                            },
                        },
                        root_dir = function(fname)
                            return util.root_pattern(
                                "pyproject.toml",
                                "setup.py",
                                "setup.cfg",
                                "requirements.txt",
                                ".git"
                            )(fname) or vim.fn.getcwd()
                        end,
                        on_init = function(client)
                            local venv = os.getenv("VIRTUAL_ENV")
                            if venv then
                                client.config.settings = client.config.settings or {}
                                client.config.settings.python = client.config.settings.python or {}
                                client.config.settings.python.pythonPath = venv .. "/bin/python"
                                print("Pyright using: " .. venv .. "/bin/python")
                            end
                        end,
                    })
                end,
            },
        })

        require("mason-tool-installer").setup({
            ensure_installed = {
                "prettier", -- prettier formatter
				"stylua", -- lua formatter
				"isort", -- python formatter
				"black", -- python formatter
				"pylint",
				"eslint_d",
                "markdownlint"
            },
            auto_update = true,
            run_on_start = true,
            run_on_write = true,
        })

        -- Configure nvim-cmp
        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'path' },  -- File paths
                { name = 'calc' },  -- Calculations
            }, {
                { name = 'buffer' },
            }),
            window = {
                completion = {
                    border = "rounded",  -- Rounded corners
                },
                documentation = {
                    border = "rounded",  -- Rounded corners for docs
                },
            },
        })

        -- Diagnostic configuration
        vim.diagnostic.config({
            virtual_text = { severity = vim.diagnostic.severity.ERROR },
            update_in_insert = true,
            float = { source = "always" },
        })

    end,
}

