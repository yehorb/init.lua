local packer = {}

packer.INSTALL_PATH = "/site/pack/packer/start/packer.nvim"
packer.REPOSITORY = "https://github.com/wbthomason/packer.nvim"

function packer.ensure_install()
  if packer.is_installed() then
    return
  end
  packer.install()
  vim.notify("Installed packer.nvim. Restart Neovim.", vim.log.levels.WARN, {})
end

function packer.is_installed()
  return vim.fn.empty(vim.fn.glob(packer.install_path())) == 0
end

function packer.install_path()
  return vim.fn.stdpath("data") .. packer.INSTALL_PATH
end

function packer.install()
  vim.fn.system { "git", "clone", "--depth", "1", packer.REPOSITORY, packer.INSTALL_PATH }
end

return packer
