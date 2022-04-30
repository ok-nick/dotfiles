return {
	"euclio/vim-markdown-composer",
	ft = "markdown",
	-- this plugin requires the binary to be installed in the default directory
	-- by default I store them in a global folder which is why setting the env variable is necessary
	run = { "set CARGO_TARGET_DIR=target", "cargo build --release" },
	config = function()
		vim.g.markdown_composer_autostart = 0
	end,
}
