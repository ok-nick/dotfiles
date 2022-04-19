local path = "config/plugins/"

return {
	-- performance
	require(path .. "impatient"),
	require(path .. "filetype"),
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
	-- require(path .. "autopairs"),
	require(path .. "endwise"),
	require(path .. "sleuth"),
	-- fzf
	require(path .. "telescope"),
	require(path .. "fzf-native"),
	-- session management
	-- TODO: https://github.com/rmagatti/auto-session/issues/64
	--	require(path .. "auto-session"),
	--	require(path .. "session-lens"),
	-- require(path .. "telescope-project"), -- do I need this if I have auto-session?
	-- preview
	require(path .. "markdown-composer"),
	-- info
	require(path .. "crates"),
	require(path .. "lsp/fidget"),
	-- git
	require(path .. "gitsigns"),
	require(path .. "fugitive"),
	-- motions
	-- TODO: below, doc keybinds
	-- require(path .. "treesitter-textobjects"),
	-- require(path .. "comments"),
	-- require(path .. "matchup"),
	-- looks
	--	require(path .. "todo-comments"), -- kinda useful for telescopoe searching, but I could just grep
	require(path .. "treesitter"),
	require(path .. "indent-blankline"),
	-- themes
	--	require(path .. "themes/vim-deus"),
	require(path .. "themes/kanagawa"),
	-- to make my life difficult
	require(path .. "hardtime"),
}
