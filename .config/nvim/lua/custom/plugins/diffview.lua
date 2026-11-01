return {
	"sindrets/diffview.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("diffview").setup({
			enhanced_diff_hl = true, -- See ':h diffview-config-enhanced_diff_hl'
			view = {
				merge_tool = {
					layout = "diff3_mixed",
				},
			},
		})

		-- Keymaps
		vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", { desc = "[G]it [D]iff" })
		vim.keymap.set("n", "<leader>gD", "<cmd>DiffviewClose<cr>", { desc = "[G]it [D]iff Close" })
		vim.keymap.set("n", "<leader>gh", "<cmd>DiffviewFileHistory<cr>", { desc = "[G]it [H]istory" })
		vim.keymap.set("n", "<leader>gH", "<cmd>DiffviewFileHistory %<cr>", { desc = "[G]it [H]istory (current file)" })
	end,
}
