return {
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = {
			"cargo install tree-sitter-cli",
			function()
				require("nvim-treesitter.install").update({ with_sync = true })
			end,
		},
		config = function()
			if vim.loop.os_uname().sysname == "Windows" then
				-- https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support#troubleshooting
				require("nvim-treesitter.install").compilers = { "clang" }
			end

			-- custom parser path so they are cached separately from plugins
			local parser_path = vim.fn.stdpath("data") .. "/site"
			vim.opt.runtimepath:append(parser_path)

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
					"bash",
					"c",
					"c_sharp",
					"cpp",
					"python",
					"java",
					"scheme",
					"html",
					"sxhkdrc",
				},
				auto_install = true,
				parser_install_dir = parser_path,

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
