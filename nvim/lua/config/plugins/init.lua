local path = "config/plugins/"

return {
	-- performance
	require(path .. "impatient"),
	require(path .. "fixcursorhold"),
	-- package manager
	require(path .. "mason"),
	-- diagnostics
	require(path .. "lsp"),
	-- completion
	require(path .. "cmp"),
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
	-- git
	require(path .. "gitsigns"),
	require(path .. "fugitive"),
	-- motions
	require(path .. "surround"),
	-- require(path .. "sandwich"), -- using nvim-surround
	-- TODO: below, doc keybinds
	require(path .. "treesitter-textobjects"),
	require(path .. "comment"),
	-- require(path .. "matchup"),
	-- looks
	require(path .. "treesitter"),
	-- require(path .. "yati"),
	require(path .. "indent-blankline"),
	require(path .. "zen-mode"),
	-- themes
	require(path .. "themes/kanagawa"),
	-- to make my life difficult
	require(path .. "hardtime"),
}
