return {
	"rebelot/kanagawa.nvim",
	config = function()
		require("kanagawa").setup({
			undercurl = false, -- alacritty doesn't support undercurls yet
		})
		-- TODO: this should be moved somewhere more general
		vim.cmd("colorscheme kanagawa")
	end,
}
