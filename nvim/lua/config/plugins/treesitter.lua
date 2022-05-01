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
			highlight = { enable = true },
			-- TODO: tons of other configs I could setup here
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.inner",
						["ic"] = "@class.outer",
						["ab"] = "@block.outer",
						["ib"] = "@block.inner",
						["c"] = "@comment.outer",
						["st"] = "@statement.outer",
						["acl"] = "@call.outer",
						["icl"] = "@call.inner",
						["ap"] = "@parameter.outer",
						["ip"] = "@parameter.inner",
						["aco"] = "@conditional.outer",
						["ico"] = "@conditional.inner",
					},
				},
			},
		})
	end,
}
