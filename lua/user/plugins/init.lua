pcall(require, "impatient")

require("user.tools.packer")
  :ensure_install()
  :packadd()
  :install_autosync("*/plugins/*.lua")

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
  use "lewis6991/impatient.nvim"
  use { "wbthomason/packer.nvim", opt = true, event = "VimEnter" }

  if require("user.tools.packer"):is_bootstrap() then
    packer.sync()
  end
end)
