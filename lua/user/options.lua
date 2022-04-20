option = vim.opt

-- Disable file backup
option.backup = false

-- Always use a clipboard
option.clipboard = "unnamedplus"

-- Silent running
option.errorbells = false
option.visualbell = false

-- Human readable tabs
option.expandtab = true
option.tabstop = 2
option.shiftwidth = 2

-- Default file-content encoding
option.fileencoding = "utf-8"

-- No more CRLF
option.fileformat = "unix"

-- GUI Font
option.guifont = "Iosevka Term SS08"

-- Allow switching without saving
option.hidden = true

-- Smart search case
option.ignorecase = true
option.smartcase = true

-- Search visuals
option.incsearch = true

-- Enable listing of invisible characters (npsb = non-breakable space)
option.list = true
option.listchars = { eol = "¶", tab = "→·", trail = "·", nbsp = "+" }

-- Enable mouse for all modes
option.mouse = "a"

-- Position in file
option.number = true
option.relativenumber = true
option.ruler = true
-- Enable column for errors by default
option.signcolumn = "number"

-- Maximum number of items to show in the popup menu
option.pumheight = 10

-- Enable better scrolling
option.scrolloff = 8
option.sidescrolloff = 4

-- Force convenient splits
option.splitbelow = true
option.splitright = true

-- Fix for incorrect colors in some terminals (code.exe terminal)
if vim.call("has", "termguicolors") then
  option.termguicolors = true
end

-- Save undo history
option.undofile = true

-- Disable line wrapping
option.wrap = false
