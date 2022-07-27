return {
	"machakann/vim-sandwich",
	config = function()
		-- TODO: https://github.com/machakann/vim-sandwich/wiki/Introduce-vim-surround-keymappings#text-objects
		-- use vim-surround keybinds since the default keybinds overwrite vim keybindTs
		vim.cmd(":runtime macros/sandwich/keymap/surround.vim")
		vim.fn["operator#sandwich#set"]("all", "all", "hi_duration", 0)
	end,
}
