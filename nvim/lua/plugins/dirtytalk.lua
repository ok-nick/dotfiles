return {
	"psliwka/vim-dirtytalk",
	build = function()
		vim.cmd("DirtytalkUpdate")
	end,
	init = function()
		-- TODO: disable install prompt each startup
		-- vim.opt.spelllang:append("programming")
	end,
}
