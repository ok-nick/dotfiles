local plugins = {
	"themes",
	"cmp",
	"comment",
	"crates",
	"gitsigns",
	"hardtime",
	"indent-blankline",
	"lsp",
	"markdown-composer",
	"surround",
	"telescope",
	"treesitter",
	"zen-mode",
}

for _, plugin in ipairs(plugins) do
	-- TODO: async it
	require("plugins/"..plugin)
end
