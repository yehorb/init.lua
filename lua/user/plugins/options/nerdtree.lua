local keymap = require "user.keymaps"

keymap.keymap("n", "<C-e>", ':NERDTreeToggle<Enter>', keymap.options)

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
