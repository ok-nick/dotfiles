return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	-- {
	-- 	"WhoIsSethDaniel/mason-tool-installer.nvim",
	-- 	after = "mason.nvim",
	-- 	config = function()
	-- 		require("mason-tool-installer").setup({
	-- 			ensure_installed = {},
	-- 			auto_update = true,
	-- 		})
	-- 	end,
	-- },
	{
		"jayp0521/mason-null-ls.nvim",
		after = { "mason.nvim", "null-ls.nvim" },
		config = function()
			local mason_null_ls = require("mason-null-ls")
			require("mason-null-ls").setup({})
		end,
	},
}
