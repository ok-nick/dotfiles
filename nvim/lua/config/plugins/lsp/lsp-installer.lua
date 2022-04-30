return {
	"williamboman/nvim-lsp-installer",
	after = { "cmp-nvim-lsp", "nvim-lspconfig" },
	config = function()
		-- for some reason I have to define this stuff here
		local path = "config/plugins/lsp/"
		local servers = {
			["rust_analyzer"] = true,
			["sumneko_lua"] = true,
			["clangd"] = true,
			["taplo"] = true,
			["jsonls"] = true,
			["yamlls"] = true,
		}

		local lsp_installer = require("nvim-lsp-installer")
		for name in pairs(servers) do
			local exists, server = lsp_installer.get_server(name)
			if exists then
				if not server:is_installed() then
					print("installing LSP server, " .. name)
					server:install()
				end
			else
				print("LSP server, " .. name .. ", does not exist")
			end
		end

		local map = vim.api.nvim_buf_set_keymap
		local default = { noremap = true, silent = true }
		local function on_attach()
			map(0, "n", "<leader>wa", "<cmd>lua vim.lsp.buf.declaration()<CR>", default)
			map(0, "n", "<leader>wg", "<cmd>lua vim.lsp.buf.definition()<CR>", default)
			map(0, "n", "<leader>wh", "<cmd>lua vim.lsp.buf.hover()<CR>", default)
			map(0, "n", "<leader>wi", "<cmd>lua vim.lsp.buf.implementation()<CR>", default)
			map(0, "n", "<leader>ws", "<cmd>lua vim.lsp.buf.signature_help()<CR>", default)
			map(0, "n", "<leader>wwa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", default)
			map(0, "n", "<leader>wwr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", default)
			map(0, "n", "<leader>ww", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", default)
			map(0, "n", "<leader>wt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", default)
			map(0, "n", "<leader>wm", "<cmd>lua vim.lsp.buf.rename()<CR>", default)
			map(0, "n", "<leader>we", "<cmd>lua vim.lsp.buf.code_action()<CR>", default)
			map(0, "n", "<leader>wl", "<cmd>lua vim.lsp.buf.references()<CR>", default)
			map(0, "n", "<leader>wf", "<cmd>lua vim.lsp.buf.formatting()<CR>", default)
		end

		lsp_installer.on_server_ready(function(server)
			local options = {
				capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
				on_attach = on_attach,
			}

			if servers[server.name] then
				require(path .. server.name)(server, options)
			else
				server:setup(options)
			end
		end)
	end,
}
