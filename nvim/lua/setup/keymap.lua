for _, map in ipairs(require("config/keymap")) do
	vim.keymap.set(unpack(map))
end
