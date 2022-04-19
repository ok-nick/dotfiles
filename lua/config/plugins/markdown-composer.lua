return {
	"euclio/vim-markdown-composer",
	ft = "markdown",
	run = "cargo build --release",
	config = function()
		vim.g.markdown_composer_autostart = 0
	end,
}
