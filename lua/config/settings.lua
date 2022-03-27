return {
	-- commands to call
	commands = {},
	-- editor options
	editor_options = {
		-- enables spell checking
		spell = true,
		-- sets the spelling language to United States, English
		spelllang = "en_us",
		-- wait x milliseconds before writing the file to disk
		updatetime = 300,
		-- use highlight colors based off color scheme
		termguicolors = true,
		-- better indenting
		smartindent = true,
		-- opens horizontal windows at the bottom-right instead of the top-left
		splitbelow = true,
		splitright = true,
		-- allows the mouse to be used in any mode
		-- mouse = "a",
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
		-- enable relative line numbers
		-- relativenumber = true,
		-- highlight the current line
		cursorline = true,
		-- expand tabs to spaces
		expandtab = true,
		-- use four spaces by default
		tabstop = 4,
		shiftwidth = 4,
		softtabstop = 4,
		-- minimum number of lines to display above and below the cursor
		scrolloff = 5,
		-- always show the command while typing in visual mode
		showcmd = true,
		-- disable beeping and use visuals instead
		visualbell = true,
		-- folding section is based off indents
		foldmethod = "indent",
		-- fold levels below this number will be closed (not sure what this really means?)
		foldlevel = 999,
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
