-- Requires dot from graphviz (for crate graphs) and lldb
return {
	"simrat39/rust-tools.nvim",
	requires = { "mfussenegger/nvim-dap", "nvim-lua/plenary.nvim" },
	after = { "nvim-lspconfig", "nvim-lsp-installer" },
}
