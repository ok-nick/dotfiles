return {
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
		build = function()
			local job = require("plenary.job")
			job:new({
				-- command = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
				command = "make",
				cwd = vim.fn.stdpath("data") .. "/lazy/telescope-fzf-native.nvim",
			}):sync()
		end,
		config = function()
			require("telescope").load_extension("fzf")
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
		build = function()
			local job = require("plenary.job")
			job:new({
				command = "cargo install ripgrep fd-find",
			}):sync()
		end,
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
	},
}
