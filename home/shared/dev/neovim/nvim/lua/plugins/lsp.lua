function on_attach(client, bufnr)
	local bufopts = { buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<leader>f", function()
		vim.lsp.buf.format({ async = true })
	end, bufopts)

	vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
	vim.keymap.set("n", "<leader>a", vim.diagnostic.setqflist)
	vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

	-- automatically update loclist/qfixlist with diagnostics
	-- vim.api.nvim_create_autocmd({ "DiagnosticChanged" }, {
	-- 	callback = function()
	-- 		vim.diagnostic.setloclist({ open = false })
	-- 		vim.diagnostic.setqflist({ open = false })
	-- 	end,
	-- })

	-- 	if client.server_capabilities.documentFormattingProvider then
	-- 		-- format on save
	-- 		vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	-- 			callback = function()
	-- 				vim.lsp.buf.format({
	-- 					bufnr = bufnr,
	-- 				})
	-- 			end,
	-- 		})
	-- 	end
end

require("fidget").setup({})

local extension_path = vim.env.HOME .. "/.vscode/extensions/vadimcn.vscode-lldb/"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
require("rust-tools").setup({
	tools = {
		-- autoSetHints = false,
		inlay_hints = {
			only_current_line = true,
		},
	},
	dap = {
		adapter = {
			adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
		},
	},
	server = {
		-- I HAVE to define this here otherwise it will overwrite the default one as nil
		on_attach = on_attach,
		settings = {
			["rust-analyzer"] = {
				rustfmt = {
					rangeFormatting = {
						enable = true,
					},
				},
			},
		},
	},
})

-- vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
-- 	-- TODO: run if in java workspace
-- 	pattern = { "*.java" },
-- 	callback = function()
-- 		require("jdtls").start_or_attach({
-- 			cmd = vim.list_extend({
-- 				"jdt-language-server",
-- 			}, require("lspconfig.server_configurations.jdtls").default_config.cmd, 2),
-- 			root_dir = vim.fs.dirname(vim.fs.find({ ".gradlew", ".git", "mvnw" }, { upward = true })[1]),
-- 			-- https://github.com/mfussenegger/nvim-jdtls#java-xy-language-features-are-not-available
-- 			settings = {
-- 				java = {
-- 					configuration = {
-- 						runtimes = {
-- 							{
-- 								name = "JavaSE-19",
-- 								-- path = vim.env.HOME .. "/.config/openjdk/19",
-- 								path = vim.env.JAVA_HOME,
-- 							},
-- 						},
-- 					},
-- 				},
-- 			},
-- 		})
-- 	end,
-- })

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
		-- null_ls.builtins.diagnostics.ruff,
		-- null_ls.builtins.formatting.ruff,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.diagnostics.selene.with({
			method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
		}),
		null_ls.builtins.formatting.black,
		-- null_ls.builtins.diagnostics.markdownlint,
		-- null_ls.builtins.formatting.markdownlint,
		null_ls.builtins.code_actions.eslint_d,
		null_ls.builtins.diagnostics.eslint_d.with({
			method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
		}),
		-- null_ls.builtins.code_actions.gitsigns,
		-- null_ls.builtins.diagnostics.vale.with({
		-- 	extra_filetypes = { "text" },
		-- }),
		null_ls.builtins.formatting.prettier.with({
			disabled_filetypes = { "markdown" },
		}),
		-- null_ls.builtins.formatting.prettierd.with({
		-- 	disabled_filetypes = { "markdown" },
		-- }),
		null_ls.builtins.code_actions.statix,
		null_ls.builtins.diagnostics.deadnix,
	},
	on_attach = on_attach,
})

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
				cargo = {
					allFeatures = true,
				},
				importPrefix = "crate",
				importEnforceGranularity = true,
			},
		},
	},
	ruff_lsp = {
		on_attach = function(client)
			-- for use with pyright
			-- https://github.com/astral-sh/ruff-lsp#example-neovim
			client.server_capabilities.hoverProvider = false
		end,
	},
	lua_ls = {
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
	jdtls = {
		cmd = vim.list_extend({
			"jdt-language-server",
		}, require("lspconfig.server_configurations.jdtls").default_config.cmd, 2),
	},
	clangd = {
		cmd = {
			"clangd",
			"--background-index",
			"--suggest-missing-includes",
			"--clang-tidy",
		},
	},
	pyright = {},
	omnisharp = {
		cmd = {
			"dotnet",
			vim.fn.stdpath("data") .. "/mason/packages/omnisharp/OmniSharp.dll",
		},
		settings = {
			-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#omnisharp
			enable_roslyn_analyzers = true,
		},
	},
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
	nil_ls = {
		settings = {
			["nil"] = {
				formatting = {
					command = { "alejandra" },
				},
			},
		},
	},
	-- https://github.com/unifiedjs/unified-language-server/issues/44#issuecomment-1379667410
	-- remark_ls = {
	-- 	settings = {
	-- 		-- https://github.com/unifiedjs/unified-engine/blob/main/doc/options.md
	-- 		processor = "remark",
	-- 		plugins = {
	-- 			"remark-github",
	-- 			"remark-gfm",
	-- 			"remark-breaks",
	-- 			"remark-preset-lint-recommended",
	-- 		},
	-- 	},
	-- },
	-- TODO: or use vale configured properly
	grammarly = {
		filetypes = { "asciidoc", "markdown", "text", "tex" },
		init_options = {
			clientId = require("secrets").grammarly,
		},
	},
	typst_lsp = {
		settings = {
			exportPdf = "onType",
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
		cmd = options.cmd,
		settings = options.settings,
		filetypes = options.filetypes,
		init_options = options.init_options,
	})
end
