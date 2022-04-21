local options = {
  clipboard = "unnamed",
  expandtab = true,
  tabstop = 2,
  shiftwidth = 2,
  fileencoding = "utf-8",
  fileformat = "unix",
  guifont = "Iosevka Term SS08",
  ignorecase = true,
  smartcase = true,
  list = true,
  listchars = { eol = "¶", tab = "→·", trail = "·", nbsp = "+" },
  mouse = "a",
  number = true,
  relativenumber = true,
  signcolumn = "number",
  pumheight = 10,
  scrolloff = 8,
  sidescrolloff = 4,
  splitbelow = true,
  splitright = true,
  undofile = true,
  wrap = false,
}

for option, value in pairs(options) do
  vim.opt[option] = value
end

if vim.call("has", "termguicolors") then
  vim.opt.termguicolors = true
end
