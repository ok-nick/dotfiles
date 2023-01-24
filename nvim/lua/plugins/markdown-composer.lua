return {
	enabled = false, -- glow.nvim
	"euclio/vim-markdown-composer",
	ft = "markdown",
	build = "cargo build --release",
	config = function()
		-- I have cargo set to compile everything in a global folder
		-- vim.g.markdown_composer_binary = vim.fn.expand("$HOME/Documents/crate_targets/release/markdown-composer")
		vim.g.markdown_composer_binary = vim.fn.expand("~/crate_targets/release/markdown-composer")
		vim.g.markdown_composer_autostart = 0
	end,
}
