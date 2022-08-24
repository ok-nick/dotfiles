-- Load up the autocompletion engine
return {
	"hrsh7th/nvim-cmp",
	requires = {
		"hrsh7th/cmp-nvim-lsp",
		"f3fora/cmp-spell",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-buffer",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		{
			"Saecki/crates.nvim",
			tag = "v0.2.1",
			requires = "nvim-lua/plenary.nvim",
			after = "plenary.nvim",
		},
		{
			"David-Kunz/cmp-npm",
			requires = "nvim-lua/plenary.nvim",
			after = "plenary.nvim",
		},
	},
	after = { "LuaSnip", "crates.nvim", "null-ls.nvim", "cmp-npm" },
	config = function()
		require("crates").setup({
			null_ls = {
				enabled = true,
				name = "crates.nvim",
			},
		})
		require("cmp-npm").setup({})

		-- https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip
		local function has_words_before()
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		local luasnip = require("luasnip")
		local cmp = require("cmp")
		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = {
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping({
					i = cmp.mapping.abort(),
					c = cmp.mapping.close(),
				}),
				["<CR>"] = cmp.mapping.confirm({ select = false }),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i", "s" }),

				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			},
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				-- { name = "luasnip" },
				{ name = "cmdline" },
				{ name = "nvim_lsp_signature_help" },
				{ name = "crates" },
				{ name = "npm", keyword_length = 4 },
				-- { name = "path" },
				-- { name = "spell" },
			}, {
				{ name = "buffer" },
			}),
		})

		-- cmp.setup.cmdline("/", {
		-- 	mapping = cmp.mapping.preset.cmdline(),
		-- 	sources = {
		-- 		{ name = "buffer" },
		-- 	},
		-- })

		-- cmp.setup.cmdline("?", {
		-- 	mapping = cmp.mapping.preset.cmdline(),
		-- 	sources = {
		-- 		{ name = "buffer" },
		-- 	},
		-- })

		-- cmp.setup.cmdline(":", {
		-- 	mapping = cmp.mapping.preset.cmdline(),
		-- 	sources = cmp.config.sources({
		-- 		-- { name = "path" },
		-- 	}, {
		-- 		{ name = "cmdline", keyword_pattern = [=[[^[:blank:]\!]*]=] },
		-- 	}),
		-- })
	end,
}
