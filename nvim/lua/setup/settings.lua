-- this is required instead of `tbl_extend` because neovim does some metatable hackery
local function set_settings(namespace, settings)
	for key, value in pairs(settings) do
		vim[namespace][key] = value
	end
end

-- loads all the general settings
local settings = require("config/settings")
set_settings("o", settings.editor_options)
set_settings("go", settings.global_options)
set_settings("wo", settings.window_options)
set_settings("bo", settings.buffer_options)
set_settings("v", settings.variables)
set_settings("g", settings.global_variables)
set_settings("b", settings.buffer_variables)
set_settings("w", settings.window_variables)
set_settings("t", settings.tabpage_variables)
set_settings("env", settings.environment_variables)

for _, cmd in ipairs(settings.commands) do
	vim.cmd(cmd)
end
