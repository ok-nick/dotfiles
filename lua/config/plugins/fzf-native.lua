return {
	"nvim-telescope/telescope-fzf-native.nvim",
	requires = "telescope.nvim",
	run = "make",
	after = "telescope.nvim",
	config = function()
		require("telescope").load_extension("fzf")
	end,
}
