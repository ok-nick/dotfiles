return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{ -- TODO: mason install generic tools as well? like ripgrep?
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"selene",
					"stylua",
				},
				auto_update = true,
			})
		end,
	},
}
