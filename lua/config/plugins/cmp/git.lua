-- Git completions
return {
	"petertriho/cmp-git",
	requires = "nvim-lua/plenary.nvim",
	after = "nvim-cmp",
	config = function()
		require("cmp_git").setup()
	end,
}
