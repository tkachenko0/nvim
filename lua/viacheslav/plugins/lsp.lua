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
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "b0o/schemastore.nvim",
    },

    config = function()
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )

        require("fidget").setup()
        require("mason").setup()
        require("mason-tool-installer").setup({
            ensure_installed = {
                "prettier", -- prettier formatter
                "stylua", -- lua formatter
                "isort", -- python formatter
                "black", -- python formatter
                "pylint",
                "eslint_d",
                "markdownlint",
            },
            auto_update = true,
            run_on_start = true,
            run_on_write = true,
        })

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(e)
                local opts = { buffer = e.buf }
                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                vim.keymap.set("n", "K", function() vim.lsp.buf.hover { border = "single" } end, opts)
                vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
                vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
                vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
                vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
                vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
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
                "jsonls",
                "dockerls",
                "docker_compose_language_service",
                "yamlls"
            },
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        capabilities = capabilities,
                    })
                end,
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
                ["jsonls"] = function()
                    require("lspconfig").jsonls.setup({
                        capabilities = capabilities,
                        settings = {
                            json = {
                                schemas = require("schemastore").json.schemas(),
                                validate = { enable = true },
                            },
                        },
                    })
                end,
                ["yamlls"] = function()
                        require("lspconfig").yamlls.setup({
                            capabilities = capabilities,
                        settings = {
                            yaml = {
                                validate = true,
                                hover = true,
                                completion = true,
                                schemas = require("schemastore").yaml.schemas(), -- use schemastore to get common schemas
                                schemaStore = {
                                    enable = false, -- disable built-in so schemastore.nvim takes over
                                },
                                format = {
                                    enable = true,
                                },
                            },
                        },
                    })
                end,
                ["docker_compose_language_service"] = function()
                    require("lspconfig").docker_compose_language_service.setup({
                        capabilities = capabilities,
                        filetypes = { "yaml" },
                        root_dir = require("lspconfig.util").root_pattern("docker-compose.yaml", "docker-compose.yml", "compose.yaml", "compose.yml", ".git"),
                        settings = {
                            dockerCompose = {
                                enable = true,
                            },
                        },
                    })
                end,
            },
        })

        local cmp = require('cmp')
        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            preselect = cmp.PreselectMode.Item,
            completion = {
                completeopt = 'menu,menuone,noinsert',
            },
            mapping = cmp.mapping.preset.insert({
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'path' },
                { name = 'calc' },
            }, {
                { name = 'buffer' },
            }),
            window = {
                completion = {
                    border = "rounded",
                },
                documentation = {
                    border = "rounded",
                },
            },
        })
    end,
}
