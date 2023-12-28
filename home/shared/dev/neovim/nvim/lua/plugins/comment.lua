require("Comment").setup({})

-- https://github.com/numToStr/Comment.nvim#%EF%B8%8F-filetypes--languages
local ft = require("Comment.ft")
ft.set("typst", { "//%s", "/*%s*/" })
