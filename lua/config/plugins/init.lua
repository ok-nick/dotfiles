local path = "config/plugins/"

-- All active plugins listed here, each module should return a packer.use compatible parameter
-- Each plugin is loaded in the order of which they are defined
return {
	require(path .. "impatient"),
	require(path .. "filetype"),
	require(path .. "fixcursorhold"),
	require(path .. "lsp/lspconfig"),
	require(path .. "luasnip"),
	require(path .. "cmp/cmp"),
	require(path .. "cmp/luasnip"),
	require(path .. "cmp/buffer"),
	require(path .. "cmp/git"),
	require(path .. "cmp/lsp"),
	require(path .. "cmp/spell"),
	require(path .. "lsp/lsp-installer"),
	require(path .. "rust-tools"),
	require(path .. "crates"),
	-- require(path .. "neo-tree"),
	require(path .. "todo-comments"),
	require(path .. "treesitter"),
	require(path .. "telescope"),
	require(path .. "gitsigns"),
	require(path .. "autopairs"),
	require(path .. "endwise"),
	require(path .. "lsp/fidget"),
	require(path .. "sleuth"),
	require(path .. "fugitive"),
	require(path .. "indent-blankline"),
	require(path .. "lsp/null-ls"),
	-- require(path .. "dressing"), -- TODO: not sure what difference this makes yet
	require(path .. "themes/vim-deus"),
	require(path .. "themes/kanagawa"),
}
