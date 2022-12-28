return {
	enabled = false, -- TODO: support linux
	"euclio/vim-markdown-composer",
	ft = "markdown",
	build = function()
		local job = require("plenary.job")
		job:new({
			command = "cargo build --release",
			cwd = vim.fn.stdpath("data") .. "/lazy/vim-markdown-composer",
		}):sync()
	end,
	config = function()
		-- I have cargo set to compile everything in a global folder
		vim.g.markdown_composer_binary = vim.fn.expand("$HOME/Documents/crate_targets/release/markdown-composer")
		-- vim.g.markdown_composer_autostart = 0
	end,
}
