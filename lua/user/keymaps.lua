local options = { noremap = true, silent = true }
local args = {
  [""] = {
    ["Y"] = '"*y',
  },
  ["n"] = {
    ["j"] = "gj",
    ["k"] = "gk",
  }
}

for mode, keymaps in pairs(args) do
  for lhs, rhs in pairs(keymaps) do
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
  end
end
