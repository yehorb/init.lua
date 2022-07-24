local options = { noremap = true, silent = true }

vim.keymap.set("", "\\", "<NOP>", options)
vim.g.mapleader = "\\"

vim.keymap.set("", "Y", '"*y', options)

vim.keymap.set("n", "<C-h>", "<C-w>h", options)
vim.keymap.set("n", "<C-j>", "<C-w>j", options)
vim.keymap.set("n", "<C-k>", "<C-w>k", options)
vim.keymap.set("n", "<C-l>", "<C-w>l", options)

vim.keymap.set("v", "<", "<gv", options)
vim.keymap.set("v", ">", ">gv", options)

vim.keymap.set("t", "<Leader><Esc>", "<C-\\><C-n>", options)
