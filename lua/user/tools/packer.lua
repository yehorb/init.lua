local M = {}

M.BOOTSTRAP = 0
M.INSTALL_PATH = "/site/pack/packer/start/packer.nvim"
M.REPOSITORY = "https://github.com/wbthomason/packer.nvim"

--- ensure_install makes sure that packer.nvim is installed.
function M.ensure_install()
  if M.is_installed() then
    return
  end
  M.install()
  vim.notify("Installed packer.nvim. Restart Neovim.", vim.log.levels.WARN, {})
end

--- is_installed checks if expected packer.nvim installation directory exists.
function M.is_installed()
  return vim.fn.empty(vim.fn.glob(M.install_path())) ~= 1
end

--- install_path computes expected packer.nvim installation directory.
function M.install_path()
  return vim.fn.stdpath("data") .. M.INSTALL_PATH
end

--- install clones packer.nvim git repository into the expected installation
--- directory.
function M.install()
  M.BOOTSTRAP = vim.fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    M.REPOSITORY,
    M.install_path()
  }
end


--- install_autosync creates autocommand to trigger packer.sync() on plugins
--- defintion file edit.
-- @param plugins_file string: Plugin defintion file name.
function M.install_autosync(plugins_file)
  vim.cmd(string.format([[
    augroup packer_autosync
      autocmd!
      autocmd BufWritePost %s source <afile> | PackerSync
    augroup end
  ]], plugins_file))
end

return M
