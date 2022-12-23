return {
	"folke/zen-mode.nvim",
	config = function()
		require("zen-mode").setup({
			plugins = {
				options = {
					number = false,
				},
				gitsigns = { enabled = false },
			},
		})
	end,
}
