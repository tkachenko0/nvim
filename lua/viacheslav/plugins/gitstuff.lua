return {

	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			current_line_blame = true,
			current_line_blame_opts = {
				virt_text = true,
				delay = 0,
				ignore_whitespace = false,
				virt_text_priority = 100,
				use_focus = true,
			},
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns
				local function map(mode, l, r, desc)
					vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
				end
				map("n", "]h", gs.next_hunk, "Next Hunk")
				map("n", "[h", gs.prev_hunk, "Prev Hunk")
				map("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
				map("n", "<leader>hS", gs.stage_buffer, "Stage buffer")
				map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
				map("n", "<leader>hR", gs.reset_buffer, "Reset buffer")
				map("n", "<leader>hu", gs.undo_stage_hunk, "Undo stage hunk")
				map("n", "<leader>hd", gs.diffthis, "Diff this")
				map("n", "<leader>hD", function() gs.diffthis("~") end, "Diff this ~")
			end,
		},
	},


	{
		"tpope/vim-fugitive",
		cmd  = { "Git", "G" }, -- lazy-load on :Git / :G commands
		keys = {
			-- { "<leader>gs", "<cmd>Git<CR>",         desc = "Git status (Fugitive)" },
			-- { "<leader>gd", "<cmd>Gvdiffsplit<CR>", desc = "Diff vs index/HEAD" },
			-- { "<leader>gb", "<cmd>Git blame<CR>",   desc = "Blame" },
			-- { "<leader>gl", "<cmd>Glog -- %<CR>",   desc = "Log for current file" },
		},
		init = function()
			vim.opt.diffopt:append({ "algorithm:patience", "indent-heuristic" }) -- nicer diffs
		end,
	},

	{
		'sindrets/diffview.nvim',
		dependencies = {
			'nvim-lua/plenary.nvim',
		},
		cmd = {
			'DiffviewOpen',
			'DiffviewClose',
			'DiffviewToggleFiles',
			'DiffviewFocusFiles',
			'DiffviewRefresh',
			'DiffviewFileHistory',
		},
		keys = {
			{ '<leader>dv', '<cmd>DiffviewOpen<cr>',        desc = 'Open Diffview' },
			{ '<leader>dh', '<cmd>DiffviewFileHistory<cr>', desc = 'File History' },
			{ '<leader>dc', '<cmd>DiffviewClose<cr>',       desc = 'Close Diffview' },
		},
		config = function()
			local actions = require("diffview.actions")
			require("diffview").setup({
				keymaps = {
					file_panel = {
						{ "n", "a", actions.toggle_stage_entry, { desc = "Stage / unstage the selected entry." } },
						{ "n", "A", actions.stage_all,          { desc = "Stage all entries" } },
					},
				},
				hooks = {
					view_opened = function()
						-- Hide tabline/bufferline when diffview opens
						vim.opt.showtabline = 0
					end,
					view_closed = function()
						-- Restore tabline/bufferline when diffview closes
						vim.opt.showtabline = 2
					end,
				},
			})
		end,
	},

}
