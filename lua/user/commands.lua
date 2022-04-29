-- Syntax highlighting
vim.cmd "filetype on"
vim.cmd "syntax enable"

-- Current word help command
require("user.tools.cwhelp"):install_command()
require("user.tools.cwhelp"):install_keymap()
