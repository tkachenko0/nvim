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
				map("n", "[c", gs.prev_hunk, "Prev Hunk")
				map("n", "]c", gs.next_hunk, "Next Hunk")

				map("n", "<leader>cs", gs.stage_hunk, "Stage hunk")
				map("n", "<leader>cS", gs.stage_buffer, "Stage buffer")

				map("n", "<leader>cr", gs.reset_hunk, "Reset hunk")
				map("n", "<leader>cR", gs.reset_buffer, "Reset buffer")

				map("n", "<leader>cu", gs.undo_stage_hunk, "Undo stage hunk")

				map("n", "<leader>cd", gs.diffthis, "Diff this")
				map("n", "<leader>cD", function() gs.diffthis("~") end, "Diff this ~")
			end,
		},
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
			{ '<leader>ds', '<cmd>DiffviewOpen<cr>',          desc = 'Open Diffview' },
			{ '<leader>dh', '<cmd>DiffviewFileHistory<cr>',   desc = 'File History' },
			{ '<leader>dH', '<cmd>DiffviewFileHistory %<cr>', desc = 'File History' },
			{ '<leader>dc', '<cmd>DiffviewClose<cr>',         desc = 'Close Diffview' },
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
			})
		end,
	},

}
