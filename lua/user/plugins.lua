require("user.tools.packer").ensure_install()

local ok, packer = pcall(require, "packer")
if not ok then
  vim.notify("Error loading packer.nvim", vim.log.levels.ERROR, {})
end

require("user.tools.packer").install_autosync(packer, "plugins.lua")

packer.init()

return packer.startup(function(use)
  use "wbthomason/packer.nvim"
end)
