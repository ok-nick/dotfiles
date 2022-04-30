return {
	"Saecki/crates.nvim",
	requires = "nvim-lua/plenary.nvim",
	after = "nvim-cmp",
	event = "BufRead Cargo.toml",
	config = function()
		local crates = require("crates")
		crates.setup()
		require("cmp").register_source("crates", crates)
	end,
}
