return {
	"rebelot/kanagawa.nvim",
	config = function()
		require("kanagawa").setup({})
		-- TODO: this should probably be moved somewhere more general
		vim.cmd("colorscheme kanagawa")
	end,
}
