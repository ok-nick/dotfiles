local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

local function install_packer()
	vim.fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

local function add_packer()
	-- TODO: dodcs say this is only required if packer is installed as "opt"
	vim.api.nvim_command("packadd packer.nvim")
end

local function setup_packer()
	local util = require("packer.util")
	-- TODO: do I need this? I can pass it through .startup()
	require("packer").init({
		display = {
			-- use a floating window
			open_fn = function()
				return util.float({
					border = "single",
				})
			end,
		},
		-- enable profiling
		profile = {
			enable = true,
		},
		-- change the compile path to somewhere on the local machine
		-- this also makes it easy to reinstall everything
		-- TODO: setting this breaks neo-tree, https://github.com/nvim-neo-tree/neo-tree.nvim/issues/200
		-- I think it also just breaks packer from compiling on startup in-general
		-- compile_path = util.join_paths(vim.fn.stdpath("data"), "site", "pack", "compiled.lua"),
		autoremove = true,
	})
end

local function setup_plugins()
	local packer = require("packer")
	packer.startup(function()
		packer.use({
			"wbthomason/packer.nvim",
		})

		-- `use` all of the defined plugins
		for _, plugin in ipairs(require("config/plugins")) do
			packer.use(plugin)
		end
	end)
end

-- if packer is installed then
if vim.fn.empty(vim.fn.glob(install_path)) == 0 then
	add_packer()
	setup_packer()
	setup_plugins()
else
	install_packer()
	add_packer()
	setup_packer()
	setup_plugins()
	require("packer").sync()
end
