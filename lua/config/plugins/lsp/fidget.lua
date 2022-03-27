return {
	"j-hui/fidget.nvim",
	after = "nvim-lspconfig",
	config = function()
		require("fidget").setup({})
	end,
}
