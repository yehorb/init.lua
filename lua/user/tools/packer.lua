local packer = {}

packer.BOOTSTRAP = 0
packer.INSTALL_PATH = "/site/pack/packer/start/packer.nvim"
packer.REPOSITORY = "https://github.com/wbthomason/packer.nvim"

--- ensure_install makes sure that packer.nvim is installed.
function packer.ensure_install()
  if packer.is_installed() then
    return
  end
  packer.install()
  vim.notify("Installed packer.nvim. Restart Neovim.", vim.log.levels.WARN, {})
end

--- is_installed checks if expected packer.nvim installation directory exists
function packer.is_installed()
  return vim.fn.empty(vim.fn.glob(packer.install_path())) == 0
end

--- install_path computes expected packer.nvim installation directory
function packer.install_path()
  return vim.fn.stdpath("data") .. packer.INSTALL_PATH
end

--- install clones packer.nvim git repository into the expected installation
--- directory
function packer.install()
  packer.BOOTSTRAP = vim.fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    packer.REPOSITORY,
    packer.install_path()
  }
end

return packer
