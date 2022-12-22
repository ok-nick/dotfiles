-- TODO: make a pretty lua wrapper for this

-- Highlight yanked text
vim.cmd([[
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=300}
augroup END
]])

-- Use relative numbers when editing
-- vim.cmd([[ au InsertEnter * set norelativenumber ]])
-- vim.cmd([[ au InsertLeave * set relativenumber ]])

-- replace netrw with telescope
-- vim.cmd([[
-- 	autocmd! VimEnter * if isdirectory(expand('%:p')) | exe 'cd %:p:h' | exe 'bd!'| exe 'Telescope find_files' | endif
-- ]])
