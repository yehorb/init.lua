local keymap = {
  set = vim.keymap.set,
  options = { noremap = true, silent = true },
}

keymap.set("", "\\", "<NOP>", keymap.options)
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

keymap.set("", "Y", '"*y', keymap.options)

keymap.set("n", "<C-h>", "<C-w>h", keymap.options)
keymap.set("n", "<C-j>", "<C-w>j", keymap.options)
keymap.set("n", "<C-k>", "<C-w>k", keymap.options)
keymap.set("n", "<C-l>", "<C-w>l", keymap.options)

keymap.set("v", "<", "<gv", keymap.options)
keymap.set("v", ">", ">gv", keymap.options)

keymap.set("v", "p", '"_dP"', keymap.options)

keymap.set("t", "<Leader><Esc>", "<C-\\><C-n>", keymap.options)

return keymap
