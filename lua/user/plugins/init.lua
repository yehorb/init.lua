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
  use "Xuyuanp/nerdtree-git-plugin"
  use "airblade/vim-gitgutter"
  use "arcticicestudio/nord-vim"
  use "hashivim/vim-terraform"
  use "kevinoid/vim-jsonc"
  use "lewis6991/impatient.nvim"
  use "scrooloose/nerdtree"
  use "sheerun/vim-polyglot"
  use "tpope/vim-dadbod"
  use "tpope/vim-fugitive"
  use "tpope/vim-surround"
  use "tpope/vim-unimpaired"
  use "vim-airline/vim-airline"
  use { "wbthomason/packer.nvim", opt = true, event = "VimEnter" }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  if require("user.tools.packer"):is_bootstrap() then
    packer.sync()
  end
end)
