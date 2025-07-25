return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "L3MON4D3/LuaSnip",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "b0o/schemastore.nvim",
        "j-hui/fidget.nvim",
    },
    config = function()
        require("fidget").setup()
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
                "gopls",
            },
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup({
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
                        root_dir = require("lspconfig.util").root_pattern(
                            "docker-compose.yaml",
                            "Docker-compose.yaml",
                            "docker-compose.yml",
                            "Docker-compose.yml",
                            "compose.yaml",
                            "compose.yml",
                            ".git"
                        ),
                    })
                end,
            },
        })
    end,
}
