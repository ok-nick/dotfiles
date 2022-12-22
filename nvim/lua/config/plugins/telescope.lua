return {
	"nvim-telescope/telescope.nvim",
	required = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
	run = "cargo install ripgrep fd-find",
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
			},
			pickers = {
				find_files = {
					find_command = {
						"rg",
						"--files",
						"--hidden",
						"--no-ignore",
						"--glob",
						"!node_modules",
						"--glob",
						"!.git",
						"--glob",
						"!target",
					},
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
