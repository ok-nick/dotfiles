function on_attach(client, bufnr)
	local map = vim.keymap.set
	local bufopts = { noremap = true, silent = true, buffer = bufnr }

	map("n", "gD", vim.lsp.buf.declaration, bufopts)
	map("n", "gd", vim.lsp.buf.definition, bufopts)
	map("n", "K", vim.lsp.buf.hover, bufopts)
	map("n", "gi", vim.lsp.buf.implementation, bufopts)
	map("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	map("n", "<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	map("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
	map("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
	map("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
	map("n", "gr", vim.lsp.buf.references, bufopts)
	map("n", "<leader>f", function()
		vim.lsp.buf.format({ async = true })
	end, bufopts)

	if client.server_capabilities.documentFormattingProvider then
		-- format on save
		vim.cmd([[
			augroup LspFormatting
				autocmd! * <buffer>
				autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
			augroup END
		]])
	end
end

return {
	{
		"j-hui/fidget.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			require("fidget").setup({})
		end,
	},
	{
		"simrat39/rust-tools.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			require("rust-tools").setup({
				tools = {
					-- autoSetHints = false,
					inlay_hints = {
						only_current_line = true,
					},
				},
				dap = {
					adapter = {
						type = "executable",
						command = "lldb-vscode",
						name = "rt_lldb",
					},
				},
				server = {
					-- I HAVE to define this here otherwise it will overwrite the default one as nil
					on_attach = on_attach,
				},
			})
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "lewis6991/gitsigns.nvim" },
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				root_dir = require("null-ls.utils").root_pattern(
					".null-ls-root",
					".git",
					"stylua.toml",
					"selene.toml",
					".luarc.json",
					".luacheckrc"
				),
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.diagnostics.selene.with({
						method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
					}),
					null_ls.builtins.formatting.black,
					null_ls.builtins.code_actions.eslint_d,
					null_ls.builtins.diagnostics.eslint_d.with({
						method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
					}),
					-- null_ls.builtins.code_actions.gitsigns,
					-- null_ls.builtins.diagnostics.vale.with({
					-- 	extra_filetypes = { "text" },
					-- }),
					null_ls.builtins.formatting.prettierd.with({
						disabled_filetypes = { "markdown" },
					}),
				},
				on_attach = on_attach,
			})
		end,
	},
	{
		"b0o/schemastore.nvim",
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "hrsh7th/cmp-nvim-lsp", "b0o/schemastore.nvim", "williamboman/mason-lspconfig.nvim" },
		config = function()
			-- vim.diagnostic.config({ virtual_text = false })

			local servers = {
				rust_analyzer = {
					settings = {
						["rust-analyzer"] = {
							checkOnSave = {
								command = "clippy",
								-- allFeatures = true,
							},
							rustfmt = {
								enableRangeFormatting = true,
							},
							diagnostics = {
								enableExperimental = false,
							},
							inlayHints = {
								enable = false,
							},
							lens = {
								implementations = false,
							},
							importPrefix = "crate",
							importEnforceGranularity = true,
						},
					},
				},
				sumneko_lua = {
					on_attach = function(client)
						-- using StyLua from null-ls instead
						client.server_capabilities.documentFormattingProvider = false
						client.server_capabilities.documentRangeFormattingProvider = false
					end,
					settings = {
						Lua = {
							runtime = {
								-- TODO: this should be dynamic, based on the selene.toml, stylua.toml, etc. Otherwise defaulting to LuaJIT
								version = "LuaJIT",
								path = {
									"?.lua",
									"?/init.lua",
								},
							},
							diagnostics = {
								-- using selene through null-ls
								enable = false,
							},
							format = {
								-- using stylua through null-ls
								enable = false,
							},
							workspace = {
								library = vim.api.nvim_get_runtime_file("", true),
								checkThirdParty = false,
							},
							telemetry = {
								enable = false,
							},
						},
					},
				},
				luau_lsp = {},
				clangd = {
					settings = {
						cmd = {
							"clangd",
							"--background-index",
							"--suggest-missing-includes",
							"--clang-tidy",
						},
					},
				},
				pyright = {},
				-- TODO: Schemas: https://taplo.tamasfe.dev/cli/usage/validation.html
				taplo = {
					on_attach = function(client)
						-- For some reason formatting capabilities aren't specified by default.
						client.server_capabilities.documentFormattingProvider = true
						client.server_capabilities.documentRangeFormattingProvider = true
					end,
				},
				jsonls = {
					capabilities = { textDocument = { completion = { completionItem = { snippetSupport = true } } } },
					setings = {
						json = {
							schemas = require("schemastore").json.schemas(),
							validate = { enable = true },
						},
					},
				},
				yamlls = {
					-- TODO: https://github.com/b0o/SchemaStore.nvim/pull/10
				},
				-- TODO: or use vale configured properly
				grammarly = {
					filetypes = { "asciidoc", "markdown", "text", "tex" },
					init_options = {
						clientId = require("secrets").grammarly,
					},
				},
			}

			local lspconfig = require("lspconfig")
			for server, options in pairs(servers) do
				lspconfig[server].setup({
					capabilities = require("cmp_nvim_lsp").default_capabilities(),
					on_attach = function(client, bufnr)
						if options.on_attach then
							options.on_attach(client, bufnr)
						end

						on_attach(client, bufnr)
					end,
					root_dir = options.root_dir,
					settings = options.settings,
					filetypes = options.filetypes,
					init_options = options.init_options,
				})
			end
		end,
	},
}
