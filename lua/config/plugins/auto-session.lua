return {
	"rmagatti/auto-session",
	config = function()
		require("auto-session").setup({
			-- my config folder is persisted across all of my devices
			auto_session_root_dir = vim.fn.stdpath("config") .. "/sessions/",
		})
	end,
}
