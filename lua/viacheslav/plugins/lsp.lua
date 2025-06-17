return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "L3MON4D3/LuaSnip",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "b0o/schemastore.nvim",
    },

    config = function()
        require("mason").setup()

        require("mason-tool-installer").setup({
            ensure_installed = {
                "prettier",
                "stylua",
                "isort",
                "black",
                "pylint",
                "markdownlint",
            },
            auto_update = true,
            run_on_start = true,
            run_on_write = true,
        })

        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "ts_ls",
                "cssls",
                "html",
                "angularls",
                "pyright",
                "jsonls",
                "dockerls",
                "docker_compose_language_service",
                "yamlls",
                "eslint",
            },
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup({
                    })
                end,

                ["lua_ls"] = function()
                    require("lspconfig").lua_ls.setup({
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = {
                                        "vim",
                                        "it",
                                        "describe",
                                        "before_each",
                                        "after_each"
                                    },
                                },
                            },
                        },
                    })
                end,

                ["pyright"] = function()
                    local lspconfig = require("lspconfig")
                    local util = require("lspconfig/util")
                    lspconfig.pyright.setup({
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
                        settings = {
                            yaml = {
                                validate = true,
                                hover = true,
                                completion = true,
                                schemas = require("schemastore").yaml.schemas(),
                                schemaStore = {
                                    enable = false,
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
                        filetypes = { "yaml" },
                        root_dir = require("lspconfig.util").root_pattern(
                            "docker-compose.yaml",
                            "docker-compose.yml",
                            "compose.yaml",
                            "compose.yml",
                            ".git"
                        ),
                        settings = {
                            dockerCompose = {
                                enable = true,
                            },
                        },
                    })
                end,

            },
        })
    end,
}
