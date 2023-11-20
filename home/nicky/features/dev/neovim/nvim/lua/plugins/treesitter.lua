require("nvim-treesitter.configs").setup({
	-- handled by nix
	auto_instll = false,
	highlight = { enable = true },
	indent = {
		enable = true,
		disable = { "python", "yaml" },
	},
	-- TODO: tons of other configs I could setup here
	-- https://github.com/nvim-treesitter/nvim-treesitter-textobjects#text-objects-move
	-- should setup ^
	-- also:
	-- https://github.com/RRethy/nvim-treesitter-textsubjects
	textobjects = {
		select = {
			enable = true,
			include_surrounding_whitespace = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ab"] = "@block.outer",
				["ib"] = "@block.inner",
				["ad"] = "@comment.outer",
				["ac"] = "@call.outer",
				["ic"] = "@call.inner",
				["aa"] = "@parameter.outer",
				["ia"] = "@parameter.inner",
				["ai"] = "@conditional.outer",
				["ii"] = "@conditional.inner",
				["ao"] = "@return.inner",
				["al"] = "@assignment.lhs",
				["ar"] = "@assignment.rhs",
			},
		},
	},
})
