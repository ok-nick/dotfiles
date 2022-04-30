local keymap = require("config/keymap")

for _, map in ipairs(keymap.global) do
	vim.api.nvim_set_keymap(unpack(map))
end

for _, map in ipairs(keymap.buffer) do
	vim.api.nvim_buf_set_keymap(unpack(map))
end
