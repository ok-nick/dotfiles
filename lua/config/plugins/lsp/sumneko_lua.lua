return function(server, options)
	options.settings = {
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
	}

	server:setup(options)
end
