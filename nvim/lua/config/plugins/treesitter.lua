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
				"scheme",
				-- "todotxt" -- TODO: need this?
			},
			highlight = { enable = true },
			-- TODO: tons of other configs I could setup here
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["al"] = "@class.inner",
						["il"] = "@class.outer",
						["ab"] = "@block.outer",
						["ib"] = "@block.inner",
						["c"] = "@comment.outer",
						["st"] = "@statement.outer",
						["ac"] = "@call.outer",
						["ic"] = "@call.inner",
						["aa"] = "@parameter.outer",
						["ia"] = "@parameter.inner",
						["ao"] = "@conditional.outer",
						["io"] = "@conditional.inner",
					},
				},
			},
		})
	end,
}
