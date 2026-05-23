return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'mason-org/mason.nvim',
      'mason-org/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      'b0o/schemastore.nvim',
    },
    config = function()
      require('mason').setup {
        registries = {
          'github:mason-org/mason-registry',
          'github:Crashdummyy/mason-registry',
        },
      }

      require('mason-tool-installer').setup {
        ensure_installed = {
          'prettier',
          'roslyn',
          'sql-formatter',
        },
        auto_update = true,
        run_on_start = true,
      }

      vim.lsp.config('jsonls', {
        settings = {
          json = {
            schemas = require('schemastore').json.schemas(),
            validate = { enable = true },
          },
        },
      })

      vim.lsp.config('yamlls', {
        settings = {
          yaml = {
            validate = true,
            hover = true,
            completion = true,
            schemas = require('schemastore').yaml.schemas(),
            schemaStore = { enable = false },
            format = { enable = true },
          },
        },
      })

      vim.lsp.config('docker_compose_language_service', {
        root_markers = {
          'docker-compose.yaml',
          'docker-compose.yml',
          'compose.yaml',
          'compose.yml',
          '.git',
        },
      })

      require('mason-lspconfig').setup {
        ensure_installed = {
          'lua_ls',
          'ts_ls',
          'cssls',
          'html',
          'pyright',
          'jsonls',
          'dockerls',
          'docker_compose_language_service',
          'yamlls',
          'eslint',
          'sqlls',
        },
      }
    end,
  },
  {
    'seblyng/roslyn.nvim',
    ft = 'cs',
    opts = {
      filewatching = 'off',
      broad_search = false,
      lock_target = false,
    },
    init = function()
      vim.lsp.config('roslyn', {
        capabilities = {
          workspace = {
            didChangeWatchedFiles = {
              dynamicRegistration = true,
            },
          },
        },
        settings = {
          ['csharp|background_analysis'] = {
            dotnet_analyzer_diagnostics_scope = 'openFiles',
            dotnet_compiler_diagnostics_scope = 'openFiles',
          },
        },
      })
    end,
  },
}
