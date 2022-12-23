return {
	"psliwka/vim-dirtytalk",
	build = function()
		vim.cmd("DirtytalkUpdate")
		vim.opt += "programming"
	end,
}
