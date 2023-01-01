return {
	{
		"rebelot/kanagawa.nvim",
		config = function()
			local colors = require("kanagawa.colors").setup()
			require("kanagawa").setup({
				overrides = {
					SpellBad = { sp = colors.diag.info },
					SpellCap = { sp = colors.diag.info },
					SpellLocal = { sp = colors.diag.info },
					SpellRare = { sp = colors.diag.info },
				},
			})
			vim.cmd("colorscheme kanagawa")
		end,
	},
}
