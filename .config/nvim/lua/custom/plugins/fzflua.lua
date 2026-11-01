return {
	"ibhagwan/fzf-lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local fzf_lua = require("fzf-lua")

		fzf_lua.setup({
			files = {
				cmd = "fd --type f --hidden --follow",
				git_icons = true,
				file_icons = true,
				color_icons = true,
			},
			grep = {
				cmd = "rg --column --line-number --no-heading --color=always --smart-case",
				rg_opts = "--hidden --follow",
				git_icons = true,
				file_icons = true,
				color_icons = true,
			},
			live_grep = {
				cmd = "rg --column --line-number --no-heading --color=always --smart-case",
				rg_opts = "--hidden --follow",
				git_icons = true,
				file_icons = true,
				color_icons = true,
			},
			grep_curbuf = {
				cmd = "rg --column --line-number --no-heading --color=always --smart-case",
				rg_opts = "--hidden --follow",
				git_icons = true,
				file_icons = true,
				color_icons = true,
			},
			oldfiles = {
				include_current_session = true,
				git_icons = true,
				file_icons = true,
				color_icons = true,
			},
		})

		vim.keymap.set("n", "<leader>sf", fzf_lua.files, { desc = "[S]earch [F]iles" })
		vim.keymap.set("n", "<leader>s/", fzf_lua.live_grep, { desc = "[S]earch by [G]rep" })
		vim.keymap.set("n", "<leader>sb", fzf_lua.buffers, { desc = "[S]earch [B]uffers" })
		vim.keymap.set("n", "<leader>sh", fzf_lua.help_tags, { desc = "[S]earch [H]elp" })
		vim.keymap.set("n", "<leader>sk", fzf_lua.keymaps, { desc = "[S]earch [K]eymaps" })
		vim.keymap.set("n", "<leader>s.", fzf_lua.oldfiles, { desc = "[S]earch [O]ld files" })
		vim.keymap.set("n", "<leader>sc", fzf_lua.git_status, { desc = "[S]earch [G]it [S]tatus" })
		vim.keymap.set("n", "<leader>sgc", fzf_lua.git_commits, { desc = "[S]earch [G]it [C]ommits" })
		vim.keymap.set("n", "<leader>sgb", fzf_lua.git_branches, { desc = "[S]earch [G]it [B]ranches" })
		vim.keymap.set("n", "<leader>sgf", fzf_lua.git_files, { desc = "[S]earch [G]it [F]iles" })
		vim.keymap.set("n", "<leader><leader>", fzf_lua.buffers, { desc = "[ ] Find existing buffers" })

		vim.keymap.set("n", "<leader>/", function()
			if fzf_lua and fzf_lua.grep_curbuf then
				fzf_lua.grep_curbuf()
			end
		end, { desc = "[/] Fuzzily search in current buffer" })

		vim.keymap.set("n", "<leader>sn", function()
			if fzf_lua and fzf_lua.files then
				fzf_lua.files({ cwd = vim.fn.stdpath("config") })
			end
		end, { desc = "[S]earch [N]eovim files" })
	end,
}
