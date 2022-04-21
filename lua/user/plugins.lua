require("user.tools.packer"):ensure_install():install_autosync("plugins.lua")

local ok, packer = pcall(require, "packer")
if not ok then
  vim.notify("Error loading packer.nvim", vim.log.levels.ERROR, {})
  return nil
end

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  }
}

return packer.startup(function(use)
  use "arcticicestudio/nord-vim"
  use "wbthomason/packer.nvim"
end)
