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
})
