return {
	"rmagatti/auto-session",
	-- TODO: do I need to mkdir the sessions folder before?
	config = function()
		require("auto-session").setup({
			-- my config folder is persisted across all of my devices
			auto_session_root_dir = vim.fn.stdpath("config") .. "/sessions/",
		})
	end,
}
