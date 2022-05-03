local keymap = require "user.keymaps"

keymap.set("v", "<Leader>bb", ":DB<Enter>", keymap.options)

-- *.dbout generated by vim-dadbod is usually pgsql
vim.cmd [[
  augroup dadbod
    autocmd!
    autocmd BufNewFile,BufRead *.dbout let b:sql_type_override='pgsql' | set syntax=sql | set filetype=sql
  augroup END
]]
