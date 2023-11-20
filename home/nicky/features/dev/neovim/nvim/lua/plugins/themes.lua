require("kanagawa").setup({
	overrides = function(colors)
		local theme = colors.theme
		return {
			SpellBad = { sp = theme.diag.info },
			SpellCap = { sp = theme.diag.info },
			SpellLocal = { sp = theme.diag.info },
			SpellRare = { sp = theme.diag.info },
		}
	end,
})
vim.cmd("colorscheme kanagawa")
