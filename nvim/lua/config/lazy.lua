local install_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(install_path) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		install_path,
	})
end

vim.opt.runtimepath:prepend(install_path)

require("lazy").setup("plugins", {
	install = {
		colorscheme = { "kanagawa" },
	},
	checker = {
		enabled = true,
		notify = false,
	},
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				-- "netrwPlugin",
				"tarPlugin",
				"tohtml",
				"zipPlugin",
			},
		},
	},
	ui = {
		icons = {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			source = "📄",
			start = "🚀",
			task = "📌",
		},
	},
})

vim.keymap.set("n", "<leader>lh", "<cmd>Lazy home<cr>")
vim.keymap.set("n", "<leader>lp", "<cmd>Lazy profile<cr>")
vim.keymap.set("n", "<leader>lu", "<cmd>Lazy update<cr>")
vim.keymap.set("n", "<leader>ll", "<cmd>Lazy log<cr>")

-- https://github.com/folke/lazy.nvim/issues/120#issuecomment-1364482723
-- same key as mason's help menu to avoid overriding the `?` navigational key
require("lazy.view.config").commands.help.key = "g?"
