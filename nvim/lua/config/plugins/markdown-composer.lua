return {
	"euclio/vim-markdown-composer",
	ft = "markdown",
	-- TODO: this just doesn't run
	run = { "cargo build --release" },
	config = function()
		-- I have cargo set to compile everything in a global folder
		-- TODO: set to %USERPROFILE%
		vim.g.markdown_composer_binary = "C:/Users/nicky/Documents/crate_targets/release/markdown-composer"
		vim.g.markdown_composer_autostart = 0
	end,
}
