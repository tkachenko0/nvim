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
				"eslint.config.mjs",
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

		lint.linters_by_ft = {
			javascript = eslint_config_exists() and { "eslint_d" } or {},
			typescript = eslint_config_exists() and { "eslint_d" } or {},
			javascriptreact = eslint_config_exists() and { "eslint_d" } or {},
			typescriptreact = eslint_config_exists() and { "eslint_d" } or {},
			svelte = eslint_config_exists() and { "eslint_d" } or {},
			-- python = { "pylint" },
			markdown = { "markdownlint" },
		}

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
