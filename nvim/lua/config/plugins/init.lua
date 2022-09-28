return {
	{ "wbthomason/packer.nvim" },

	{ "lewis6991/impatient.nvim" },
	{ "antoinemadec/FixCursorHold.nvim" },

	{ "williamboman/mason.nvim" },
	{ "jayp0521/mason-null-ls.nvim" },

	{ "j-hui/fidget.nvim" },
	{
		"simrat39/rust-tools.nvim",
		requires = { "mfussenegger/nvim-dap", "nvim-lua/plenary.nvim" },
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		requires = "nvim-lua/plenary.nvim",
	},
	{ "neovim/nvim-lspconfig" },

	{ "nvim-treesitter/nvim-treesitter" },
	{ "nvim-treesitter/nvim-treesitter-textobjects" },
	{ "lewis6991/spellsitter.nvim" },

	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "f3fora/cmp-spell" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-buffer" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "hrsh7th/cmp-cmdline" },
	{ "hrsh7th/cmp-nvim-lsp-signature-help" },
	{
		"David-Kunz/cmp-npm",
		requires = "nvim-lua/plenary.nvim",
	},
	{
		"Saecki/crates.nvim",
		tag = "v0.3.0", -- TODO: check if new version exists
		requires = "nvim-lua/plenary.nvim",
	},

	{ "L3MON4D3/LuaSnip" },
	{ "tpope/vim-sleuth" },
	{ "psliwka/vim-dirtytalk" },
	{
		"nvim-telescope/telescope.nvim",
		required = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'",
			},
		},
		-- TOOD: use mason internal API to install pre-built binaries
		run = {
			"cargo install ripgrep",
			"cargo install fd-find",
		},
	},
	{
		"euclio/vim-markdown-composer",
		-- TODO: same issue here as telescope cargo deps
		run = { "cargo build --release" },
	},
	{ "lewis6991/gitsigns.nvim" },
	{ "tpope/vim-fugitive" },

	-- TODO: replace with https://github.com/kylechui/nvim-surround
	{ "machakann/vim-sandwich" },
	{ "numToStr/Comment.nvim" },

	{ "nvim-treesitter/nvim-treesitter" },
	{ "lukas-reineke/indent-blankline.nvim" },
	{ "folke/zen-mode.nvim" },

	{ "rebelot/kanagawa.nvim" },

	{ "takac/vim-hardtime" },
}
