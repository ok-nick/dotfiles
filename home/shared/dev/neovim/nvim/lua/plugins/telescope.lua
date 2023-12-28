require("telescope").load_extension("fzf")

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
				-- "--no-ignore",
				"--glob",
				"!node_modules",
				"--glob",
				"!.git",
				"--glob",
				"!target",
			},
		},
	},
})

local function themed_picker(picker)
	return function()
		require("telescope.builtin")[picker](require("telescope.themes").get_ivy({
			borderchars = {
				{ "─", "│", "─", "│", "┌", "┐", "┘", "└" },
				prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
				results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
				preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
			},
			width = 0.8,
			prompt_title = false,
		}))
	end
end

vim.keymap.set("n", "<leader>tg", themed_picker("live_grep"))
vim.keymap.set("n", "<leader>tg", themed_picker("live_grep"))
vim.keymap.set("n", "<leader>tb", themed_picker("buffers"))
vim.keymap.set("n", "<leader>tf", themed_picker("find_files"))
vim.keymap.set("n", "<leader>tq", themed_picker("quickfix"))
vim.keymap.set("n", "<leader>th", themed_picker("command_history"))
vim.keymap.set("n", "<leader>to", themed_picker("oldfiles"))
vim.keymap.set("n", "<leader>ts", themed_picker("treesitter"))
-- TODO: https://github.com/syphar/dotfiles/blob/ddfd8996cd5ae8574d6eb6ab9326aaee00d785f0/.config/nvim/lua/dc/lsp/init.lua#L100-L106
vim.keymap.set("n", "<leader>tl", themed_picker("loclist"))
vim.keymap.set("n", "<leader>tn", themed_picker("spell_suggest"))
vim.keymap.set("n", "<leader>tw", themed_picker("current_buffer_fuzzy_find"))
vim.keymap.set("n", "<leader>tr", themed_picker("resume"))
vim.keymap.set("n", "<leader>td", themed_picker("diagnostics"))
