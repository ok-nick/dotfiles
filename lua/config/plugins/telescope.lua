-- TODO: this is erroring on install for some reason
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
		telescope.setup({
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
				file_browser = {},
			},
		})
	end,
	{ -- increases the performance of telescope
		"nvim-telescope/telescope-fzf-native.nvim",
		requires = "telescope.nvim",
		run = "make",
		config = function()
			require("telescope").load_extension("fzf")
		end,
	},
	{ -- file explorer for telescope, uses fd-find
		"nvim-telescope/telescope-file-browser.nvim",
		requires = "telescope.nvim",
		config = function()
			require("telescope").load_extension("file_browser")
		end,
	},
}
