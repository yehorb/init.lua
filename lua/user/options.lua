local options = {
  fileencoding = "utf-8",
  fileformat = "unix",
  fileformats = { "unix", "dos" },
  list = true,
  listchars = { eol = "↵", tab = "→·", trail = "·", nbsp = "+" },
  splitbelow = true,
  splitright = true,
}

if vim.fn.has("termguicolors") then
  options.termguicolors = true
end

for option, value in pairs(options) do
  vim.opt[option] = value
end
