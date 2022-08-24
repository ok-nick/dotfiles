return {
	-- commands to call
	commands = {
		-- uses the new neovim filetype module (buggy)
		-- "let g:did_load_filetypes = 0",
		-- "let g:do_filetype_lua = 1",
		-- limit the size of netrw to 15% of the screen
		-- "let g:netrw_winsize = 15",
		-- remove the banner
		"let g:netrw_banner = 0",
	},
	-- editor options
	editor_options = {
		-- disables end of line, vim-sleuth automatically handles this
		endofline = false,
		fixendofline = false,
		-- expand tabs to spaces
		expandtab = true,
		-- use four spaces by default
		tabstop = 4,
		shiftwidth = 4,
		softtabstop = 4,
		-- enables spell checking
		spell = true,
		-- sets the spelling language to United States, English
		spelllang = "en_us,programming",
		-- wait x milliseconds before writing the file to disk
		updatetime = 150,
		-- limits the width of formatting text to 100
		textwidth = 100,
		-- use highlight colors based off color scheme
		termguicolors = true,
		-- better indenting
		smartindent = true,
		-- opens horizontal windows at the bottom-right instead of the top-left
		--	splitbelow = true,
		--	splitright = true,
		-- always display the sign column with a fixed offset
		signcolumn = "yes:1",
		-- enable completion popup menu
		completeopt = "menu,menuone,noselect",
		-- output Utf-8 in the terminal
		encoding = "utf-8",
		-- force file writes to use Utf-8
		fileencoding = "utf-8",
		-- enable line numbers
		number = true,
		-- highlight the current line
		cursorline = true,
		-- minimum number of lines to display above and below the cursor
		-- scrolloff = 1,
		-- always show the command while typing in visual mode
		-- showcmd = true,
		-- disable beeping and use visuals instead
		-- visualbell = true,
		-- folding section is based off indents
		foldmethod = "indent",
		-- fold levels below this number will be closed (not sure what this really means?)
		foldlevel = 999,
		-- limit the amount of auto-complete entries
		pumheight = 5,
		-- disable highlighting of every match in a search
		hlsearch = false,
		-- persist undo history
		undofile = true,
	},
	-- options that apply globally
	global_options = {},
	-- options that apply to a specific window
	window_options = {},
	-- options that apply to a specific buffer
	buffer_options = {},
	-- not sure tbh
	variables = {},
	-- variables applied globally
	global_variables = {},
	-- variables applied to the buffer
	buffer_variables = {},
	-- variables applied to the window
	window_variables = {},
	-- variables applied to the tabpage
	tabpage_variables = {},
	-- variables applied to the environment
	environment_variables = {},
}
