return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v2.x",
	requires = {
		"nvim-lua/plenary.nvim",
		-- TODO: better icons?
		"kyazdani42/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		-- remove legacy commands
		vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

		-- diagnostic errors
		vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
		vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
		vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
		vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

		require("neo-tree").setup({})
	end,
}
