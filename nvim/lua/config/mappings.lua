-- TODO: https://github.com/Avimitin/nvim/blob/master/lua/mappings/other.lua
local default = { silent = true }

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

local keymaps = {
	-- unbind default mapping for space key
	{ "n", " ", "", default },
	-- open telescope live grep
	{ "n", "<leader>tg", themed_picker("live_grep"), default },
	-- open telescope buffers
	{ "n", "<leader>tb", themed_picker("buffers"), default },
	-- open telescope find files
	{ "n", "<leader>tf", themed_picker("find_files"), default },
	-- open telescope quick fix
	{ "n", "<leader>tq", themed_picker("quickfix"), default },
	-- open telescope command history
	{ "n", "<leader>th", themed_picker("command_history"), default },
	-- open telescope old files
	{ "n", "<leader>to", themed_picker("oldfiles"), default },
	-- open telescope treesitter
	{ "n", "<leader>ts", themed_picker("treesitter"), default },
	-- TODO: https://github.com/syphar/dotfiles/blob/ddfd8996cd5ae8574d6eb6ab9326aaee00d785f0/.config/nvim/lua/dc/lsp/init.lua#L100-L106
	-- open telescope loclist (quickfix of current window)
	{ "n", "<leader>tl", themed_picker("loclist"), default },
	-- open telescope spell suggest
	{ "n", "<leader>tn", themed_picker("spell_suggest"), default },
	-- open telescope current buffer fuzzy find
	{ "n", "<leader>tw", themed_picker("current_buffer_fuzzy_find"), default },
	-- open telescope current buffer tags
	{ "n", "<leader>ta", themed_picker("current_buffer_tags"), default },
	-- open telescope at last state
	{ "n", "<leader>tr", themed_picker("resume"), default },
	-- open telescope diagnostics
	{ "n", "<leader>td", themed_picker("diagnostics"), default },
	-- sync packer
	{ "n", "<leader>ps", "<cmd>PackerSync<CR>", default },
	-- compile packer
	{ "n", "<leader>pc", "<cmd>PackerCompile<CR>", default },
	-- profile packer
	{ "n", "<leader>pp", "<cmd>PackerProfile<CR>", default },
	-- open diagnostics in floating window
	{ "n", "<leader>e", ":lua vim.diagnostic.open_float()<CR>", default },
	-- go to next diagnostic
	{ "n", "]d", ":lua vim.diagnostic.goto_next()<CR>", default },
	-- go to previous diagnostic
	{ "n", "[d", ":lua vim.diagnostic.goto_prev()<CR>", default },
	-- add all diagnostics to the quickfix list
	{ "n", "<leader>a", ":lua vim.diagnostic.setqflist()<CR>", default },
	-- add buffer diagnostics to the location list
	{ "n", "<leader>q", ":lua vim.diagnostic.setloclist()<CR>", default },
	-- zen mode
	{ "n", "<leader>zm", require("zen-mode").toggle, default },
}

for _, map in ipairs(keymaps) do
	vim.keymap.set(unpack(map))
end
