local zen_mode = require("zen-mode")
zen_mode.setup({
	plugins = {
		options = {
			-- disable line numbers
			number = false,
			-- break lines at the end of works
			linebreak = true,
			-- move to next/prev line if cursor is at the beginning/end of line
			whichwrap = "b,s,h,l", -- TODO: this should be appended, not set
		},
		gitsigns = { enabled = false },
	},
	on_open = function()
		vim.keymap.set("n", "j", "gj")
		vim.keymap.set("n", "k", "gk")
		vim.keymap.set("n", "0", "g0")
		vim.keymap.set("n", "^", "g^")
		vim.keymap.set("n", "$", "g$")
		vim.cmd("HardTimeOff")
	end,
	on_close = function()
		vim.keymap.set("n", "j", "j")
		vim.keymap.set("n", "k", "k")
		vim.keymap.set("n", "0", "0")
		vim.keymap.set("n", "^", "^")
		vim.keymap.set("n", "$", "$")
		vim.cmd("HardTimeOn")
	end,
})

vim.keymap.set("n", "<leader>we", zen_mode.toggle)
