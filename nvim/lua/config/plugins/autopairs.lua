-- TODO: this is erroring for some reason
return {
	"windwp/nvim-autopairs",
	after = { "nvim-cmp", "nvim-treesitter" },
	config = function()
		local autopairs = require("nvim-autopairs")
		autopairs.setup({
			check_ts = true,
			enable_check_bracket_line = true,
		})
		autopairs.add_rules(require("nvim-autopairs.rules.endwise-lua"))

		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local cmp = require("cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
	end,
}
