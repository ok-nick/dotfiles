-- TODO: https://github.com/Avimitin/nvim/blob/master/lua/mappings/other.lua
local default = { noremap = true, silent = true }

return {
	global = {
		-- map <leader> to <leader> for `showcmd`
		{ "n", "<space>", "<leader>", { silent = true } },

		-- open telescope file browser
		{ "n", "<leader>fe", "<cmd>Telescope file_browser<CR>", default },
		-- open telescope live grep
		{ "n", "<leader>fg", "<cmd>Telescope live_grep<CR>", default },
		-- open telescope buffers
		{ "n", "<leader>fb", "<cmd>Telescope buffers<CR>", default },

		-- sync packer
		{ "n", "<leader>ps", "<cmd>PackerSync<CR>", default },
		-- compile packer
		{ "n", "<leader>pc", "<cmd>PackerCompile<CR>", default },
	},
	buffer = {
		-- more in config/plugins/lsp/lsp-installer
		-- more in config/plugins/cmp/cmp
	},
}
