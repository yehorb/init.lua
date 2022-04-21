local keymap = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

keymap("", "\\", "<NOP>", options)
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

keymap("", "Y", '"*y', options)

keymap("n", "<C-h>", "<C-w>h", options)
keymap("n", "<C-j>", "<C-w>j", options)
keymap("n", "<C-k>", "<C-w>k", options)
keymap("n", "<C-l>", "<C-w>l", options)

keymap("v", "<", "<gv", options)
keymap("v", ">", ">gv", options)

keymap("v", "p", '"_dP"', options)

keymap("t", "<Leader><Esc>", "<C-\\><C-n>", options)
