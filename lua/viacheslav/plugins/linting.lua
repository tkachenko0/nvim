return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")
		local uv = vim.loop

		local function eslint_config_exists()
			local config_files = {
				".eslintrc",
				".eslintrc.json",
				".eslintrc.js",
				".eslintrc.cjs",
				".eslintrc.yaml",
				".eslintrc.yml",
				"eslint.config.js",
				"eslint.config.cjs",
			}

			local cwd = vim.fn.getcwd()

			for _, filename in ipairs(config_files) do
				local full_path = cwd .. "/" .. filename
				local stat = uv.fs_stat(full_path)
				if stat and stat.type == "file" then
					return true
				end
			end

			return false
		end

		local eslint_linters = eslint_config_exists() and { "eslint_d" } or {}

		lint.linters_by_ft = {
			javascript = eslint_linters,
			typescript = eslint_linters,
			javascriptreact = eslint_linters,
			typescriptreact = eslint_linters,
			svelte = eslint_linters,
			-- python = { "pylint" },
			markdown = { "markdownlint" },
			json = { "jsonlint" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>l", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
