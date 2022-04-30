-- Load up the autocompletion engine
return {
	"hrsh7th/nvim-cmp",
	after = "LuaSnip",
	config = function()
		-- https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#super-tab-like-mapping
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
				["<C-z>"] = cmp.mapping.select_prev_item(),
				["<C-x>"] = cmp.mapping.select_next_item(),
				["<C-o>"] = cmp.mapping.scroll_docs(-4),
				["<C-p>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-f>"] = cmp.mapping({
					i = cmp.mapping.abort(),
					c = cmp.mapping.close(),
				}),
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Insert,
					select = false,
				}),
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
			sources = {
				{ name = "nvim_lsp" },
				-- { name = "luasnip" },
				{ name = "path" },
				{ name = "buffer" },
				{ name = "spell" },
				{ name = "cmp_git" },
			},
		})
	end,
}
