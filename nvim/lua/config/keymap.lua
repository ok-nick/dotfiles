-- TODO: https://github.com/Avimitin/nvim/blob/master/lua/mappings/other.lua
local default = { noremap = true, silent = true }

return {
	global = {
		-- map <leader> to <leader> for `showcmd`
		{ "n", "<space>", "<leader>", { silent = true } },
		-- open telescope live grep
		{ "n", "<leader>fg", "<cmd>Telescope live_grep<CR>", default },
		-- open telescope buffers
		{ "n", "<leader>fb", "<cmd>Telescope buffers<CR>", default },
		-- open telescope find files
		{ "n", "<leader>ff", "<cmd>Telescope find_files<CR>", default },
		-- open telescope quick fix
		{ "n", "<leader>fq", "<cmd>Telescope quickfix<CR>", default },
		-- open telescope command history
		{ "n", "<leader>fh", "<cmd>Telescope command_history<CR>", default },
		-- open telescope old files
		{ "n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", default },
		-- open telescope treesitter
		{ "n", "<leader>ft", "<cmd>Telescope treesitter<CR>", default },
		-- open telescope loclist (quickfix of current window)
		{ "n", "<leader>fl", "<cmd>Telescope loclist<CR>", default },
		-- open telescope spell suggest
		{ "n", "<leader>fn", "<cmd>Telescope spell_suggest<CR>", default },
		-- open telescope current buffer fuzzy find
		{ "n", "<leader>fw", "<cmd>Telescope current_buffer_fuzzy_find<CR>", default },
		-- open telescope current buffer tags
		{ "n", "<leader>fa", "<cmd>Telescope current_buffer_tags<CR>", default },
		-- open telescope at last state
		{ "n", "<leader>fr", "<cmd>Telescope resume<CR>", default },
		-- open telescope sessions
		{ "n", "<leader>fs", "<cmd>Telescope session-lens search_session<CR>", default },
		-- sync packer
		{ "n", "<leader>ps", "<cmd>PackerSync<CR>", default },
		-- compile packer
		{ "n", "<leader>pc", "<cmd>PackerCompile<CR>", default },
		-- profile packer
		{ "n", "<leader>pp", "<cmd>PackerProfile<CR>", default },
		-- open diagnostics in floating window
		{ "n", "<leader>wd", ":lua vim.diagnostic.open_float()<CR>", default },
		-- go to next diagnostic
		{ "n", "<leader>wn", ":lua vim.diagnostic.goto_next()<CR>", default },
		-- go to previous diagnostic
		{ "n", "<leader>wp", ":lua vim.diagnostic.goto_prev()<CR>", default },
	},
	buffer = {
		-- more in config/plugins/lsp/lsp-installer
		-- more in config/plugins/cmp/cmp
	},
}
