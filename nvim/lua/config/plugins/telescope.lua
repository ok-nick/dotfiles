return {
	"nvim-telescope/telescope.nvim",
	required = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
	run = {
		"cargo install ripgrep",
		"cargo install fd-find",
	},
	after = { "plenary.nvim", "nvim-treesitter" },
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<esc>"] = actions.close,
					},
				},
				-- TODO: these don't work
				file_ignore_patterns = { "%.git$", "node_modules$", "target$" },
			},
			pickers = {
				find_files = {
					hidden = true,
					no_ignore = true,
				},
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
			},
		})
	end,
}
