return {
	"nvim-telescope/telescope-project.nvim",
	requires = "telescope.nvim",
	after = "telescope.nvim",
	config = function()
		require("telescope").load_extension("project")
	end,
}
