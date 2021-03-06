function on_attach(client, bufnr)
	local map = vim.keymap.set
	local bufopts = { noremap = true, silent = true, buffer = bufnr }

	map("n", "gD", vim.lsp.buf.declaration, bufopts)
	map("n", "gd", vim.lsp.buf.definition, bufopts)
	map("n", "K", vim.lsp.buf.hover, bufopts)
	map("n", "gi", vim.lsp.buf.implementation, bufopts)
	map("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	map("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	map("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	map("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	map("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	map("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	map("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	map("n", "gr", vim.lsp.buf.references, bufopts)
	map("n", "<space>f", vim.lsp.buf.formatting, bufopts)

	if client.resolved_capabilities.document_formatting then
		-- format on save
		vim.cmd([[
			augroup LspFormatting
				autocmd! * <buffer>
				autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
			augroup END
		]])
	end
end

return {
	{
		"j-hui/fidget.nvim",
		after = "nvim-lspconfig",
		config = function()
			require("fidget").setup({})
		end,
	},
	{
		"simrat39/rust-tools.nvim",
		requires = { "mfussenegger/nvim-dap", "nvim-lua/plenary.nvim" },
		after = { "nvim-lspconfig", "nvim-lsp-installer" },
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
		requires = "nvim-lua/plenary.nvim",
		ft = { "lua", "luau" },
		run = {
			"cargo install stylua",
			"cargo install selene",
		},
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				root_dir = require("null-ls.utils").root_pattern(
					".null-ls-root",
					"Makefile",
					".git",
					"stylua.toml",
					"selene.toml",
					".luarc.json",
					".luacheckrc"
				),
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.diagnostics.selene,
				},
				on_attach = on_attach,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		requires = "williamboman/nvim-lsp-installer",
		after = { "nvim-lsp-installer", "cmp-nvim-lsp" },
		config = function()
			local lsp_installer = require("nvim-lsp-installer")
			lsp_installer.setup({
				automatic_installation = true,
			})

			local lspconfig = require("lspconfig")
			local servers = {
				["rust_analyzer"] = {
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
				["sumneko_lua"] = {
					on_attach = function(client)
						-- using StyLua from null-ls instead
						client.resolved_capabilities.document_formatting = false
						client.resolved_capabilities.document_range_formatting = false
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
							},
							telemetry = {
								enable = false,
							},
						},
					},
				},
				["clangd"] = {
					settings = {
						cmd = {
							"clangd",
							"--background-index",
							"--suggest-missing-includes",
							"--clang-tidy",
						},
					},
				},
				["eslint"] = {
					on_attach = function(client)
						client.resolved_capabilities.document_formatting = true
						client.resolved_capabilities.document_range_formatting = true
					end,
					settings = {
						run = "onSave",
					},
				},
				["taplo"] = { settings = {} },
				["jsonls"] = {
					capabilities = { textDocument = { completion = { completionItem = { snippetSupport = true } } } },
					settings = {},
				},
				["yamlls"] = {
					settings = {
						yaml = {
							validate = true,
							format = {
								enable = true,
							},
							schemaStore = {
								-- installs all available
								enable = true,
							},
						},
					},
				},
			}

			for server, options in pairs(servers) do
				lspconfig[server].setup({
					capabilities = require("cmp_nvim_lsp").update_capabilities(
						vim.tbl_extend("force", vim.lsp.protocol.make_client_capabilities(), options.capabilities or {})
					),
					on_attach = function(client, bufnr)
						if options.on_attach then
							options.on_attach(client, bufnr)
						end

						on_attach(client, bufnr)
					end,
					root_dir = options.root_dir,
					settings = options.settings,
				})
			end
		end,
	},
}
