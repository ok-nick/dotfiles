-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = true
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "C:\\Users\\nicky\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?.lua;C:\\Users\\nicky\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?\\init.lua;C:\\Users\\nicky\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?.lua;C:\\Users\\nicky\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?\\init.lua"
local install_cpath_pattern = "C:\\Users\\nicky\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\lua\\5.1\\?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["FixCursorHold.nvim"] = {
    loaded = true,
    path = "C:\\Users\\nicky\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\FixCursorHold.nvim",
    url = "https://github.com/antoinemadec/FixCursorHold.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "C:\\Users\\nicky\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-buffer"] = {
    after_files = { "C:\\Users\\nicky\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\cmp-buffer\\after\\plugin\\cmp_buffer.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "C:\\Users\\nicky\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-git"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fcmp_git\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "C:\\Users\\nicky\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\cmp-git",
    url = "https://github.com/petertriho/cmp-git"
  },
  ["cmp-nvim-lsp"] = {
    after = { "nvim-lsp-installer" },
    after_files = { "C:\\Users\\nicky\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\cmp-nvim-lsp\\after\\plugin\\cmp_nvim_lsp.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "C:\\Users\\nicky\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-spell"] = {
    after_files = { "C:\\Users\\nicky\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\cmp-spell\\after\\plugin\\cmp-spell.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "C:\\Users\\nicky\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\cmp-spell",
    url = "https://github.com/f3fora/cmp-spell"
  },
  cmp_luasnip = {
    after_files = { "C:\\Users\\nicky\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\cmp_luasnip\\after\\plugin\\cmp_luasnip.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "C:\\Users\\nicky\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["crates.nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vcrates\frequire\0" },
    loaded = true,
    path = "C:\\Users\\nicky\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\crates.nvim",
    url = "https://github.com/Saecki/crates.nvim"
  },
  ["fidget.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "C:\\Users\\nicky\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["filetype.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rfiletype\frequire\0" },
    loaded = true,
    path = "C:\\Users\\nicky\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\filetype.nvim",
    url = "https://github.com/nathom/filetype.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "C:\\Users\\nicky\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["impatient.nvim"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\19enable_profile\14impatient\frequire\0" },
    loaded = true,
    path = "C:\\Users\\nicky\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nw\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\31show_current_context_start\2\25show_current_context\2\nsetup\21indent_blankline\frequire\0" },
    loaded = true,
    path = "C:\\Users\\nicky\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["kanagawa.nvim"] = {
    config = { "\27LJ\2\ng\0\0\3\0\6\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0'\2\5\0B\0\2\1K\0\1\0\25colorscheme kanagawa\bcmd\bvim\nsetup\rkanagawa\frequire\0" },
    loaded = true,
    path = "C:\\Users\\nicky\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\kanagawa.nvim",
    url = "https://github.com/rebelot/kanagawa.nvim"
  },
  ["null-ls.nvim"] = {
    config = { "\27LJ\2\nó\1\0\1\4\0\5\0\t9\1\0\0009\1\1\1\15\0\1\0X\2\4€6\1\2\0009\1\3\1'\3\4\0B\1\2\1K\0\1\0™\1\t\t\t\t\t\taugroup LspFormatting\n\t\t\t\t\t\t\tautocmd! * <buffer>\n\t\t\t\t\t\t\tautocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()\n\t\t\t\t\t\taugroup END\n\t\t\t\t\t\bcmd\bvim\24document_formatting\26resolved_capabilitiesÅ\1\1\0\6\0\r\0\0236\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\t\0004\4\4\0009\5\3\0009\5\4\0059\5\5\5>\5\1\0049\5\3\0009\5\4\0059\5\6\5>\5\2\0049\5\3\0009\5\a\0059\5\b\5>\5\3\4=\4\n\0033\4\v\0=\4\f\3B\1\2\1K\0\1\0\14on_attach\0\fsources\1\0\0\vselene\16diagnostics\vstylua\frustfmt\15formatting\rbuiltins\nsetup\fnull-ls\frequire\0" },
    loaded = true,
    path = "C:\\Users\\nicky\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\nÃ\2\0\0\v\0\15\0\0286\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0B\1\2\0019\1\4\0006\3\0\0'\5\5\0B\3\2\0A\1\0\0016\1\0\0'\3\6\0B\1\2\0026\2\0\0'\4\a\0B\2\2\0029\3\b\2\18\5\3\0009\3\t\3'\6\n\0009\a\v\0015\t\r\0005\n\f\0=\n\14\tB\a\2\0A\3\2\1K\0\1\0\rmap_char\1\0\0\1\0\1\btex\5\20on_confirm_done\17confirm_done\aon\nevent\bcmp\"nvim-autopairs.completion.cmp%nvim-autopairs.rules.endwise-lua\14add_rules\1\0\2\30enable_check_bracket_line\2\rcheck_ts\2\nsetup\19nvim-autopairs\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "C:\\Users\\nicky\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "cmp-spell", "cmp_luasnip", "nvim-autopairs", "cmp-buffer", "cmp-git", "cmp-nvim-lsp" },
    config = { "\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequireÅ\1\0\1\3\3\5\0\29-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\19€-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4€-\1\1\0009\1\3\1B\1\1\1X\1\n€-\1\2\0B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\4\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\1À\0À\0\0\rcomplete\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisibleŽ\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\r€-\1\1\0009\1\2\1)\3ÿÿB\1\2\2\15\0\1\0X\2\5€-\1\1\0009\1\3\1)\3ÿÿB\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\1À\0À\tjump\rjumpable\21select_prev_item\fvisible¨\5\1\0\v\1+\0R6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0015\4\a\0005\5\5\0003\6\4\0=\6\6\5=\5\b\0045\5\v\0009\6\t\0019\6\n\6B\6\1\2=\6\f\0059\6\t\0019\6\r\6B\6\1\2=\6\14\0059\6\t\0019\6\15\6)\büÿB\6\2\2=\6\16\0059\6\t\0019\6\15\6)\b\4\0B\6\2\2=\6\17\0059\6\t\0019\6\18\6B\6\1\2=\6\19\0059\6\t\0015\b\21\0009\t\t\0019\t\20\tB\t\1\2=\t\22\b9\t\t\0019\t\23\tB\t\1\2=\t\24\bB\6\2\2=\6\25\0059\6\t\0019\6\26\0065\b\27\0B\6\2\2=\6\28\0059\6\t\0013\b\29\0005\t\30\0B\6\3\2=\6\31\0059\6\t\0013\b \0005\t!\0B\6\3\2=\6\"\5=\5\t\0044\5\b\0005\6#\0>\6\1\0055\6$\0>\6\2\0055\6%\0>\6\3\0055\6&\0>\6\4\0055\6'\0>\6\5\0055\6(\0>\6\6\0055\6)\0>\6\a\5=\5*\4B\2\2\0012\0\0€K\0\1\0\0À\fsources\1\0\1\tname\vcrates\1\0\1\tname\fcmp_git\1\0\1\tname\nspell\1\0\1\tname\vbuffer\1\0\1\tname\tpath\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\1\0\1\vselect\1\fconfirm\n<C-f>\6c\nclose\6i\1\0\0\nabort\14<C-Space>\rcomplete\n<C-p>\n<C-o>\16scroll_docs\n<C-x>\21select_next_item\n<C-z>\1\0\0\21select_prev_item\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\bcmp\fluasnip\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "C:\\Users\\nicky\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "C:\\Users\\nicky\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-lsp-installer"] = {
    after = { "rust-tools.nvim" },
    config = { "\27LJ\2\nº\b\0\0\a\2\27\0\\-\0\0\0)\2\0\0'\3\0\0'\4\1\0'\5\2\0-\6\1\0B\0\6\1-\0\0\0)\2\0\0'\3\0\0'\4\3\0'\5\4\0-\6\1\0B\0\6\1-\0\0\0)\2\0\0'\3\0\0'\4\5\0'\5\6\0-\6\1\0B\0\6\1-\0\0\0)\2\0\0'\3\0\0'\4\a\0'\5\b\0-\6\1\0B\0\6\1-\0\0\0)\2\0\0'\3\0\0'\4\t\0'\5\n\0-\6\1\0B\0\6\1-\0\0\0)\2\0\0'\3\0\0'\4\v\0'\5\f\0-\6\1\0B\0\6\1-\0\0\0)\2\0\0'\3\0\0'\4\r\0'\5\14\0-\6\1\0B\0\6\1-\0\0\0)\2\0\0'\3\0\0'\4\15\0'\5\16\0-\6\1\0B\0\6\1-\0\0\0)\2\0\0'\3\0\0'\4\17\0'\5\18\0-\6\1\0B\0\6\1-\0\0\0)\2\0\0'\3\0\0'\4\19\0'\5\20\0-\6\1\0B\0\6\1-\0\0\0)\2\0\0'\3\0\0'\4\21\0'\5\22\0-\6\1\0B\0\6\1-\0\0\0)\2\0\0'\3\0\0'\4\23\0'\5\24\0-\6\1\0B\0\6\1-\0\0\0)\2\0\0'\3\0\0'\4\25\0'\5\26\0-\6\1\0B\0\6\1K\0\1\0\3À\4À*<cmd>lua vim.lsp.buf.formatting()<CR>\15<leader>wf*<cmd>lua vim.lsp.buf.references()<CR>\15<leader>wR+<cmd>lua vim.lsp.buf.code_action()<CR>\15<leader>we&<cmd>lua vim.lsp.buf.rename()<CR>\15<leader>wr/<cmd>lua vim.lsp.buf.type_definition()<CR>\16<leader>wtdJ<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>\15<leader>wl7<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>\16<leader>wwr4<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>\16<leader>wwa.<cmd>lua vim.lsp.buf.signature_help()<CR>\15<leader>ws.<cmd>lua vim.lsp.buf.implementation()<CR>\15<leader>wi%<cmd>lua vim.lsp.buf.hover()<CR>\15<leader>wh*<cmd>lua vim.lsp.buf.definition()<CR>\15<leader>wd+<cmd>lua vim.lsp.buf.declaration()<CR>\15<leader>wD\6n‰\2\0\1\6\3\f\0!5\1\a\0006\2\0\0'\4\1\0B\2\2\0029\2\2\0026\4\3\0009\4\4\0049\4\5\0049\4\6\4B\4\1\0A\2\0\2=\2\b\1-\2\0\0=\2\t\1-\2\1\0009\3\n\0008\2\3\2\15\0\2\0X\3\t€6\2\0\0-\4\2\0009\5\n\0&\4\5\4B\2\2\2\18\4\0\0\18\5\1\0B\2\3\1X\2\4€\18\4\0\0009\2\v\0\18\5\1\0B\2\3\1K\0\1\0\5À\1À\0À\nsetup\tname\14on_attach\17capabilities\1\0\0\29make_client_capabilities\rprotocol\blsp\bvim\24update_capabilities\17cmp_nvim_lsp\frequireÐ\3\1\0\14\0\19\0.'\0\0\0005\1\1\0006\2\2\0'\4\3\0B\2\2\0026\3\4\0\18\5\1\0B\3\2\4H\6\25€9\a\5\2\18\t\6\0B\a\2\3\15\0\a\0X\t\14€\18\v\b\0009\t\6\bB\t\2\2\14\0\t\0X\t\15€6\t\a\0'\v\b\0\18\f\6\0&\v\f\vB\t\2\1\18\v\b\0009\t\t\bB\t\2\1X\t\6€6\t\a\0'\v\n\0\18\f\6\0'\r\v\0&\v\r\vB\t\2\1F\6\3\2R\6å6\3\f\0009\3\r\0039\3\14\0035\4\15\0003\5\16\0009\6\17\0023\b\18\0B\6\2\0012\0\0€K\0\1\0\0\20on_server_ready\0\1\0\2\vsilent\2\fnoremap\2\24nvim_buf_set_keymap\bapi\bvim\21, does not exist\17LSP server, \finstall\28installing LSP server, \nprint\17is_installed\15get_server\npairs\23nvim-lsp-installer\frequire\1\0\6\16sumneko_lua\2\18rust_analyzer\2\vyamlls\2\vjsonls\2\ntaplo\2\vclangd\2\24config/plugins/lsp/\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "C:\\Users\\nicky\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "C:\\Users\\nicky\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    after = { "nvim-autopairs" },
    loaded = true,
    only_config = true
  },
  ["nvim-treesitter-endwise"] = {
    loaded = true,
    path = "C:\\Users\\nicky\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-treesitter-endwise",
    url = "https://github.com/RRethy/nvim-treesitter-endwise"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "C:\\Users\\nicky\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "C:\\Users\\nicky\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["rust-tools.nvim"] = {
    load_after = {},
    loaded = true,
    needs_bufread = true,
    path = "C:\\Users\\nicky\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim"
  },
  ["telescope-file-browser.nvim"] = {
    config = { "\27LJ\2\nQ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\17file_browser\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "C:\\Users\\nicky\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    config = { "\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\bfzf\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "C:\\Users\\nicky\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "C:\\Users\\nicky\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18todo-comments\frequire\0" },
    loaded = true,
    path = "C:\\Users\\nicky\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["vim-deus"] = {
    loaded = true,
    path = "C:\\Users\\nicky\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-deus",
    url = "https://github.com/ajmwagar/vim-deus"
  },
  ["vim-fugitive"] = {
    commands = { "G", "Git", "Ggrep", "Gdiffsplit", "GBrowse" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "C:\\Users\\nicky\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "C:\\Users\\nicky\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-sleuth",
    url = "https://github.com/tpope/vim-sleuth"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: filetype.nvim
time([[Config for filetype.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rfiletype\frequire\0", "config", "filetype.nvim")
time([[Config for filetype.nvim]], false)
-- Config for: telescope-fzf-native.nvim
time([[Config for telescope-fzf-native.nvim]], true)
try_loadstring("\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\bfzf\19load_extension\14telescope\frequire\0", "config", "telescope-fzf-native.nvim")
time([[Config for telescope-fzf-native.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n€\2\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\14highlight\1\0\1\venable\2\fendwise\1\0\1\venable\2\21ensure_installed\1\0\0\1\16\0\0\trust\blua\tjson\nregex\ttoml\rmarkdown\tyaml\15typescript\15javascript\fcomment\6c\fc_sharp\bcpp\vpython\tjava\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: crates.nvim
time([[Config for crates.nvim]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vcrates\frequire\0", "config", "crates.nvim")
time([[Config for crates.nvim]], false)
-- Config for: kanagawa.nvim
time([[Config for kanagawa.nvim]], true)
try_loadstring("\27LJ\2\ng\0\0\3\0\6\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0'\2\5\0B\0\2\1K\0\1\0\25colorscheme kanagawa\bcmd\bvim\nsetup\rkanagawa\frequire\0", "config", "kanagawa.nvim")
time([[Config for kanagawa.nvim]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: telescope-file-browser.nvim
time([[Config for telescope-file-browser.nvim]], true)
try_loadstring("\27LJ\2\nQ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\17file_browser\19load_extension\14telescope\frequire\0", "config", "telescope-file-browser.nvim")
time([[Config for telescope-file-browser.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\nw\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\31show_current_context_start\2\25show_current_context\2\nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: impatient.nvim
time([[Config for impatient.nvim]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\19enable_profile\14impatient\frequire\0", "config", "impatient.nvim")
time([[Config for impatient.nvim]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
try_loadstring("\27LJ\2\nó\1\0\1\4\0\5\0\t9\1\0\0009\1\1\1\15\0\1\0X\2\4€6\1\2\0009\1\3\1'\3\4\0B\1\2\1K\0\1\0™\1\t\t\t\t\t\taugroup LspFormatting\n\t\t\t\t\t\t\tautocmd! * <buffer>\n\t\t\t\t\t\t\tautocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()\n\t\t\t\t\t\taugroup END\n\t\t\t\t\t\bcmd\bvim\24document_formatting\26resolved_capabilitiesÅ\1\1\0\6\0\r\0\0236\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\t\0004\4\4\0009\5\3\0009\5\4\0059\5\5\5>\5\1\0049\5\3\0009\5\4\0059\5\6\5>\5\2\0049\5\3\0009\5\a\0059\5\b\5>\5\3\4=\4\n\0033\4\v\0=\4\f\3B\1\2\1K\0\1\0\14on_attach\0\fsources\1\0\0\vselene\16diagnostics\vstylua\frustfmt\15formatting\rbuiltins\nsetup\fnull-ls\frequire\0", "config", "null-ls.nvim")
time([[Config for null-ls.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd LuaSnip ]]
vim.cmd [[ packadd nvim-cmp ]]

-- Config for: nvim-cmp
try_loadstring("\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequireÅ\1\0\1\3\3\5\0\29-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\19€-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4€-\1\1\0009\1\3\1B\1\1\1X\1\n€-\1\2\0B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\4\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\1À\0À\0\0\rcomplete\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisibleŽ\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\r€-\1\1\0009\1\2\1)\3ÿÿB\1\2\2\15\0\1\0X\2\5€-\1\1\0009\1\3\1)\3ÿÿB\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\1À\0À\tjump\rjumpable\21select_prev_item\fvisible¨\5\1\0\v\1+\0R6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0015\4\a\0005\5\5\0003\6\4\0=\6\6\5=\5\b\0045\5\v\0009\6\t\0019\6\n\6B\6\1\2=\6\f\0059\6\t\0019\6\r\6B\6\1\2=\6\14\0059\6\t\0019\6\15\6)\büÿB\6\2\2=\6\16\0059\6\t\0019\6\15\6)\b\4\0B\6\2\2=\6\17\0059\6\t\0019\6\18\6B\6\1\2=\6\19\0059\6\t\0015\b\21\0009\t\t\0019\t\20\tB\t\1\2=\t\22\b9\t\t\0019\t\23\tB\t\1\2=\t\24\bB\6\2\2=\6\25\0059\6\t\0019\6\26\0065\b\27\0B\6\2\2=\6\28\0059\6\t\0013\b\29\0005\t\30\0B\6\3\2=\6\31\0059\6\t\0013\b \0005\t!\0B\6\3\2=\6\"\5=\5\t\0044\5\b\0005\6#\0>\6\1\0055\6$\0>\6\2\0055\6%\0>\6\3\0055\6&\0>\6\4\0055\6'\0>\6\5\0055\6(\0>\6\6\0055\6)\0>\6\a\5=\5*\4B\2\2\0012\0\0€K\0\1\0\0À\fsources\1\0\1\tname\vcrates\1\0\1\tname\fcmp_git\1\0\1\tname\nspell\1\0\1\tname\vbuffer\1\0\1\tname\tpath\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\1\0\1\vselect\1\fconfirm\n<C-f>\6c\nclose\6i\1\0\0\nabort\14<C-Space>\rcomplete\n<C-p>\n<C-o>\16scroll_docs\n<C-x>\21select_next_item\n<C-z>\1\0\0\21select_prev_item\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\bcmp\fluasnip\frequire\0", "config", "nvim-cmp")

vim.cmd [[ packadd cmp-nvim-lsp ]]
vim.cmd [[ packadd cmp-git ]]

-- Config for: cmp-git
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fcmp_git\frequire\0", "config", "cmp-git")

vim.cmd [[ packadd cmp_luasnip ]]
vim.cmd [[ packadd cmp-buffer ]]
vim.cmd [[ packadd cmp-spell ]]
vim.cmd [[ packadd nvim-lspconfig ]]
vim.cmd [[ packadd fidget.nvim ]]

-- Config for: fidget.nvim
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0", "config", "fidget.nvim")

vim.cmd [[ packadd nvim-lsp-installer ]]

-- Config for: nvim-lsp-installer
try_loadstring("\27LJ\2\nº\b\0\0\a\2\27\0\\-\0\0\0)\2\0\0'\3\0\0'\4\1\0'\5\2\0-\6\1\0B\0\6\1-\0\0\0)\2\0\0'\3\0\0'\4\3\0'\5\4\0-\6\1\0B\0\6\1-\0\0\0)\2\0\0'\3\0\0'\4\5\0'\5\6\0-\6\1\0B\0\6\1-\0\0\0)\2\0\0'\3\0\0'\4\a\0'\5\b\0-\6\1\0B\0\6\1-\0\0\0)\2\0\0'\3\0\0'\4\t\0'\5\n\0-\6\1\0B\0\6\1-\0\0\0)\2\0\0'\3\0\0'\4\v\0'\5\f\0-\6\1\0B\0\6\1-\0\0\0)\2\0\0'\3\0\0'\4\r\0'\5\14\0-\6\1\0B\0\6\1-\0\0\0)\2\0\0'\3\0\0'\4\15\0'\5\16\0-\6\1\0B\0\6\1-\0\0\0)\2\0\0'\3\0\0'\4\17\0'\5\18\0-\6\1\0B\0\6\1-\0\0\0)\2\0\0'\3\0\0'\4\19\0'\5\20\0-\6\1\0B\0\6\1-\0\0\0)\2\0\0'\3\0\0'\4\21\0'\5\22\0-\6\1\0B\0\6\1-\0\0\0)\2\0\0'\3\0\0'\4\23\0'\5\24\0-\6\1\0B\0\6\1-\0\0\0)\2\0\0'\3\0\0'\4\25\0'\5\26\0-\6\1\0B\0\6\1K\0\1\0\3À\4À*<cmd>lua vim.lsp.buf.formatting()<CR>\15<leader>wf*<cmd>lua vim.lsp.buf.references()<CR>\15<leader>wR+<cmd>lua vim.lsp.buf.code_action()<CR>\15<leader>we&<cmd>lua vim.lsp.buf.rename()<CR>\15<leader>wr/<cmd>lua vim.lsp.buf.type_definition()<CR>\16<leader>wtdJ<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>\15<leader>wl7<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>\16<leader>wwr4<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>\16<leader>wwa.<cmd>lua vim.lsp.buf.signature_help()<CR>\15<leader>ws.<cmd>lua vim.lsp.buf.implementation()<CR>\15<leader>wi%<cmd>lua vim.lsp.buf.hover()<CR>\15<leader>wh*<cmd>lua vim.lsp.buf.definition()<CR>\15<leader>wd+<cmd>lua vim.lsp.buf.declaration()<CR>\15<leader>wD\6n‰\2\0\1\6\3\f\0!5\1\a\0006\2\0\0'\4\1\0B\2\2\0029\2\2\0026\4\3\0009\4\4\0049\4\5\0049\4\6\4B\4\1\0A\2\0\2=\2\b\1-\2\0\0=\2\t\1-\2\1\0009\3\n\0008\2\3\2\15\0\2\0X\3\t€6\2\0\0-\4\2\0009\5\n\0&\4\5\4B\2\2\2\18\4\0\0\18\5\1\0B\2\3\1X\2\4€\18\4\0\0009\2\v\0\18\5\1\0B\2\3\1K\0\1\0\5À\1À\0À\nsetup\tname\14on_attach\17capabilities\1\0\0\29make_client_capabilities\rprotocol\blsp\bvim\24update_capabilities\17cmp_nvim_lsp\frequireÐ\3\1\0\14\0\19\0.'\0\0\0005\1\1\0006\2\2\0'\4\3\0B\2\2\0026\3\4\0\18\5\1\0B\3\2\4H\6\25€9\a\5\2\18\t\6\0B\a\2\3\15\0\a\0X\t\14€\18\v\b\0009\t\6\bB\t\2\2\14\0\t\0X\t\15€6\t\a\0'\v\b\0\18\f\6\0&\v\f\vB\t\2\1\18\v\b\0009\t\t\bB\t\2\1X\t\6€6\t\a\0'\v\n\0\18\f\6\0'\r\v\0&\v\r\vB\t\2\1F\6\3\2R\6å6\3\f\0009\3\r\0039\3\14\0035\4\15\0003\5\16\0009\6\17\0023\b\18\0B\6\2\0012\0\0€K\0\1\0\0\20on_server_ready\0\1\0\2\vsilent\2\fnoremap\2\24nvim_buf_set_keymap\bapi\bvim\21, does not exist\17LSP server, \finstall\28installing LSP server, \nprint\17is_installed\15get_server\npairs\23nvim-lsp-installer\frequire\1\0\6\16sumneko_lua\2\18rust_analyzer\2\vyamlls\2\vjsonls\2\ntaplo\2\vclangd\2\24config/plugins/lsp/\0", "config", "nvim-lsp-installer")

vim.cmd [[ packadd rust-tools.nvim ]]
vim.cmd [[ packadd nvim-autopairs ]]

-- Config for: nvim-autopairs
try_loadstring("\27LJ\2\nÃ\2\0\0\v\0\15\0\0286\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0B\1\2\0019\1\4\0006\3\0\0'\5\5\0B\3\2\0A\1\0\0016\1\0\0'\3\6\0B\1\2\0026\2\0\0'\4\a\0B\2\2\0029\3\b\2\18\5\3\0009\3\t\3'\6\n\0009\a\v\0015\t\r\0005\n\f\0=\n\14\tB\a\2\0A\3\2\1K\0\1\0\rmap_char\1\0\0\1\0\1\btex\5\20on_confirm_done\17confirm_done\aon\nevent\bcmp\"nvim-autopairs.completion.cmp%nvim-autopairs.rules.endwise-lua\14add_rules\1\0\2\30enable_check_bracket_line\2\rcheck_ts\2\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")

time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GBrowse lua require("packer.load")({'vim-fugitive'}, { cmd = "GBrowse", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file G lua require("packer.load")({'vim-fugitive'}, { cmd = "G", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Git lua require("packer.load")({'vim-fugitive'}, { cmd = "Git", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Ggrep lua require("packer.load")({'vim-fugitive'}, { cmd = "Ggrep", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gdiffsplit lua require("packer.load")({'vim-fugitive'}, { cmd = "Gdiffsplit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
