return {
	"nvim-treesitter/nvim-treesitter",
	run = { "cargo install tree-sitter-cli" },
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"rust",
				"lua",
				"json",
				"regex",
				"toml",
				"markdown",
				"yaml",
				"typescript",
				"javascript",
				"comment",
				"c",
				"c_sharp",
				"cpp",
				"python",
				"java",
				-- "todotxt" -- TODO: need this?
			},
			endwise = { enable = true },
			highlight = { enable = true },
		})
	end,
}
