local keymap = require "user.keymaps"

keymap.set("n", "<C-e>", ':NERDTreeToggle<Enter>', keymap.options)

vim.g.NERDTreeShowHidden=1
vim.g.NERDTreeGitStatusIndicatorMapCustom = {
  Modified = "*",
  Staged = "+",
  Untracked = "-",
  Renamed = ">",
  Unmerged = "═",
  Deleted = "x",
  Dirty = "#",
  Ignored = ".",
  Clean = "k",
  Unknown = "?",
}
