return {
	"folke/zen-mode.nvim",
	config = function()
		local zen_mode = require("zen-mode")
		zen_mode.setup({
			plugins = {
				options = {
					number = false,
				},
				gitsigns = { enabled = false },
			},
		})

		vim.keymap.set("n", "<leader>zm", zen_mode.toggle)
	end,
}
