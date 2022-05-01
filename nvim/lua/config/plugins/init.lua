local path = "config/plugins/"

return {
	-- performance
	require(path .. "impatient"),
	require(path .. "fixcursorhold"),
	-- diagnostics
	require(path .. "lsp/lsp-installer"),
	require(path .. "lsp/lspconfig"),
	require(path .. "lsp/null-ls"),
	require(path .. "rust-tools"),
	-- completion
	require(path .. "cmp/cmp"),
	require(path .. "cmp/buffer"),
	require(path .. "cmp/git"),
	require(path .. "cmp/lsp"),
	require(path .. "cmp/spell"),
	-- require(path .. "cmp/luasnip"),
	require(path .. "luasnip"),
	require(path .. "sleuth"),
	require(path .. "dirtytalk"),
	-- fzf
	require(path .. "telescope"),
	require(path .. "fzf-native"),
	-- session management
	-- TODO: https://github.com/rmagatti/auto-session/issues/64
	-- require(path .. "auto-session"),
	-- require(path .. "session-lens"),
	-- require(path .. "telescope-project"),
	-- preview
	require(path .. "markdown-composer"),
	-- info
	require(path .. "crates"),
	require(path .. "lsp/fidget"),
	-- git
	require(path .. "gitsigns"),
	require(path .. "fugitive"),
	-- motions
	require(path .. "sandwich"),
	-- TODO: below, doc keybinds
	require(path .. "treesitter-textobjects"),
	require(path .. "comment"),
	-- require(path .. "matchup"),
	-- looks
	require(path .. "treesitter"),
	require(path .. "indent-blankline"),
	-- themes
	--	require(path .. "themes/vim-deus"),
	require(path .. "themes/kanagawa"),
	-- to make my life difficult
	require(path .. "hardtime"),
}
