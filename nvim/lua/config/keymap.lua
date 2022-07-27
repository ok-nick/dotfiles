-- TODO: https://github.com/Avimitin/nvim/blob/master/lua/mappings/other.lua
local default = { noremap = true, silent = true }

return {
	global = {
		-- map <leader> to <leader> for `showcmd`
		{ "n", "<space>", "<leader>", { silent = true } },
		-- open telescope live grep
		{ "n", "<leader>tg", "<cmd>Telescope live_grep<CR>", default },
		-- open telescope buffers
		{ "n", "<leader>tb", "<cmd>Telescope buffers<CR>", default },
		-- open telescope find files
		{ "n", "<leader>tf", "<cmd>Telescope find_files<CR>", default },
		-- open telescope quick fix
		{ "n", "<leader>tq", "<cmd>Telescope quickfix<CR>", default },
		-- open telescope command history
		{ "n", "<leader>th", "<cmd>Telescope command_history<CR>", default },
		-- open telescope old files
		{ "n", "<leader>to", "<cmd>Telescope oldfiles<CR>", default },
		-- open telescope treesitter
		{ "n", "<leader>ts", "<cmd>Telescope treesitter<CR>", default },
		-- open telescope loclist (quickfix of current window)
		{ "n", "<leader>tl", "<cmd>Telescope loclist<CR>", default },
		-- open telescope spell suggest
		{ "n", "<leader>tn", "<cmd>Telescope spell_suggest<CR>", default },
		-- open telescope current buffer fuzzy find
		{ "n", "<leader>tw", "<cmd>Telescope current_buffer_fuzzy_find<CR>", default },
		-- open telescope current buffer tags
		{ "n", "<leader>ta", "<cmd>Telescope current_buffer_tags<CR>", default },
		-- open telescope at last state
		{ "n", "<leader>tr", "<cmd>Telescope resume<CR>", default },
		-- open telescope diagnostics
		{ "n", "<leader>td", "<cmd>Telescope diagnostics<CR>", default },
		-- sync packer
		{ "n", "<leader>ps", "<cmd>PackerSync<CR>", default },
		-- compile packer
		{ "n", "<leader>pc", "<cmd>PackerCompile<CR>", default },
		-- profile packer
		{ "n", "<leader>pp", "<cmd>PackerProfile<CR>", default },
		-- open diagnostics in floating window
		{ "n", "<space>e", ":lua vim.diagnostic.open_float()<CR>", default },
		-- go to next diagnostic
		{ "n", "[d", ":lua vim.diagnostic.goto_next()<CR>", default },
		-- go to previous diagnostic
		{ "n", "]d", ":lua vim.diagnostic.goto_prev()<CR>", default },
		-- add all diagnostics to the quickfix list
		{ "n", "<space>a", ":lua vim.diagnostic.setqflist()<CR>", default },
		-- add buffer diagnostics to the location list
		{ "n", "<space>q", ":lua vim.diagnostic.setloclist()<CR>", default },
	},
	buffer = {
		-- more in config/plugins/lsp/lsp-installer
		-- more in config/plugins/cmp/cmp
	},
}
