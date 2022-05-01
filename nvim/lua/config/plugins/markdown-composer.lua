return {
	"euclio/vim-markdown-composer",
	ft = "markdown",
	run = { "cargo build --release" },
	config = function()
		-- I have cargo set to compile everything in a global folder
		vim.g.markdown_composer_binary = "%USERPROFILE%/Documents/crate_targets"
		vim.g.markdown_composer_autostart = 0
	end,
}
