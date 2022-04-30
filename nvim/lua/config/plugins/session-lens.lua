return {
	"rmagatti/session-lens",
	requires = { "rmagatti/auto-session", "nvim-telescope/telescope.nvim" },
	after = "telescope.nvim",
	config = function()
		require("session-lens").setup({})
		require("telescope").load_extension("session-lens")
	end,
}
