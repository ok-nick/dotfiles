return {
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		-- TODO: https://github.com/folke/lazy.nvim/issues/143
		build = {
			"cargo install tree-sitter-cli",
			function()
				require("nvim-treesitter.install").update({ with_sync = true })
			end,
		},
		config = function()
			-- https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support#troubleshooting
			require("nvim-treesitter.install").compilers = { "clang" }

			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"rust",
					"lua",
					"json",
					"regex",
					"toml",
					"markdown",
					"markdown_inline",
					"yaml",
					"typescript",
					"javascript",
					"comment",
					"bash",
					"c",
					"c_sharp",
					"cpp",
					"python",
					"java",
					"scheme",
					"html",
					"help",
				},
				auto_install = true,

				highlight = { enable = true },
				indent = { enable = true },
				-- TODO: tons of other configs I could setup here
				-- https://github.com/nvim-treesitter/nvim-treesitter-textobjects#text-objects-move
				-- should setup ^
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
							["ao"] = "@comment.outer",
							["at"] = "@statement.outer",
							["ac"] = "@call.outer",
							["ic"] = "@call.inner",
							["aa"] = "@parameter.outer",
							["ia"] = "@parameter.inner",
							["ai"] = "@conditional.outer",
							["ii"] = "@conditional.inner",
						},
					},
				},
			})
		end,
	},
}
