local commands = {
	-- remove the banner
	"let g:netrw_banner = 0",
}
local editor_options = {
	overwrite = {
		-- disable magic (vim regex) in search and replace
		magic = false,
		-- preserves end of line (vim-sleuth automatically handles this)
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
		spelllang = "en_us",
		-- wait x milliseconds before writing the file to disk
		updatetime = 150,
		-- use highlight colors based off color scheme
		termguicolors = true,
		-- better indenting
		smartindent = true,
		-- always display the sign column with a fixed offset
		signcolumn = "yes:1",
		-- disables mouse
		mouse = "",
		-- enable completion popup menu
		completeopt = "menu,menuone,noinsert,noselect",
		-- output Utf-8 in the terminal
		encoding = "utf-8",
		-- force file writes to use Utf-8
		fileencoding = "utf-8",
		-- enable line numbers
		number = true,
		-- highlight the current line
		cursorline = true,
		-- limit the amount of auto-complete entries
		pumheight = 5,
		-- disable highlighting of every match in a search
		hlsearch = false,
		-- persist undo history
		undofile = true,
	},
	append = {
		-- disable intro screen
		shortmess = "I",
	},
}

for key, value in pairs(editor_options.overwrite) do
	vim.o[key] = value
end

for key, value in pairs(editor_options.append) do
	vim.opt[key]:append(value)
end

for _, cmd in ipairs(commands) do
	vim.cmd(cmd)
end
