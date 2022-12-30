-- remove the original mapping for space
vim.keymap.set("n", " ", "")
-- set leader key (needs to be called before lazy)
vim.g.mapleader = " "

-- for some reason I have to load `settings` before `lazy`, otherwise it will error when a plugin needs to be installed
require("config/settings")
require("config/lazy")
require("config/autocmds")
require("config/mappings")

-- add lazy loading for plugins, many of them only activate on specific file types
-- use the `where cargo` command to ensure cargo exists and make and other stuff

-- considering https://github.com/michaelb/sniprun

-- maybe https://github.com/danth/pathfinder.vim
-- maybe https://github.com/mfussenegger/nvim-dap
-- maybe https://github.com/rcarriga/nvim-dap-ui
-- interesting https://github.com/danymat/neogen
-- interesting https://github.com/jose-elias-alvarez/nvim-lsp-ts-utils
-- interesting https://github.com/nvim-telescope/telescope-ui-select.nvim
-- interesting https://github.com/AckslD/nvim-neoclip.lua
-- interesting https://github.com/mcauley-penney/tidy.nvim
-- interesting https://github.com/folke/trouble.nvim
-- interesting https://github.com/SmiteshP/nvim-gps
-- interesting https://github.com/onsails/lspkind-nvim
-- interesting https://github.com/ray-x/lsp_signature.nvim
-- interesting https://github.com/kyazdani42/nvim-web-devicons
-- interesting https://github.com/norcalli/nvim-colorizer.lua
-- interesting https://github.com/ggandor/lightspeed.nvim
-- interesting https://github.com/karb94/neoscroll.nvim
-- interesting https://github.com/glepnir/lspsaga.nvim
-- interesting https://github.com/simrat39/symbols-outline.nvim

-- https://github.com/Avimitin/nvim/blob/b5e5620342a878f45f0cf8149738475254a98d75/lua/plugins/load.lua
-- https://github.com/lewis6991/gitsigns.nvim#null-ls
