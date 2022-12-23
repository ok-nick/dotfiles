return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
		config = function()
			require("mason-lspconfig").setup({
				automatic_installation = true,
			})
		end,
	},
	{
		"jayp0521/mason-null-ls.nvim",
		dependencies = { "williamboman/mason.nvim", "jose-elias-alvarez/null-ls.nvim" },
		config = function()
			require("mason-null-ls").setup({
				automatic_installation = true,
			})
		end,
	},
}
