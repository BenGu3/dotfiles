return {
	"folke/tokyonight.nvim",
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			transparent = true,
			styles = {
				comments = {
					italic = false,
				},
			},
		})
		vim.cmd.colorscheme("tokyonight-storm")
	end,
}

