return function(server, options)
	-- rust-tools + rust-analyzer settings
	options.settings = {
		dap = {
			adapter = {
				type = "executable",
				command = "lldb-vscode",
				name = "rt_lldb",
			},
		},
		server = {
			checkOnSave = {
				command = "clippy",
				allFeatures = true,
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
	}

	local rust_tools = require("rust-tools")
	-- taken from https://github.com/williamboman/nvim-lsp-installer/wiki/Rust
	rust_tools.setup({
		server = vim.tbl_deep_extend("force", server:get_default_options(), options),
	})
	server:attach_buffers()
	rust_tools.start_standalone_if_required()
end
