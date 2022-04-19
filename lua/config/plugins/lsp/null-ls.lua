return {
	"jose-elias-alvarez/null-ls.nvim",
	requires = "nvim-lua/plenary.nvim",
	-- TODO: for now this is the only file type it's used for
	ft = "lua",
	-- TODO: for some reason this makes it fail to install
	-- run = {
	-- 	"cargo install stylua",
	-- 	"cargo install selene",
	-- },
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.rustfmt,
				null_ls.builtins.formatting.stylua,
				-- TODO: only run this if a selene.toml exists
				null_ls.builtins.diagnostics.selene,
			},
			on_attach = function(client)
				if client.resolved_capabilities.document_formatting then
					-- format on save
					vim.cmd([[
						augroup LspFormatting
							autocmd! * <buffer>
							autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
						augroup END
					]])
				end
			end,
		})
	end,
}
