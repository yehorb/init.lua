local PackerTool = {}

PackerTool.BOOTSTRAP = 0
PackerTool.INSTALL_MESSAGE = (
  "Installed packer.nvim. Restart Neovim to correctly load plugins."
)
PackerTool.INSTALL_PATH = "site/pack/packer/opt/packer.nvim"
PackerTool.REPOSITORY = "https://github.com/wbthomason/packer.nvim"

--- ensure_install makes sure that packer.nvim is installed.
function PackerTool.ensure_install(self)
  if self:is_installed() then
    return self
  end
  self:install()
  vim.notify(self.INSTALL_MESSAGE, vim.log.levels.WARN, {})
  return self
end

--- is_installed checks if expected packer.nvim installation directory exists.
function PackerTool.is_installed(self)
  return vim.fn.empty(vim.fn.glob(self:install_path())) ~= 1
end

--- install_path computes expected packer.nvim installation directory.
function PackerTool.install_path(self)
  return string.format("%s/%s", vim.fn.stdpath("data"), self.INSTALL_PATH)
end

--- install clones packer.nvim git repository into the expected installation
--- directory.
function PackerTool.install(self)
  self.BOOTSTRAP = vim.fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    self.REPOSITORY,
    self:install_path()
  }
end

--- load adds packer.nvim package to vim runtime.
-- Installing packer.nvim as opt allows zero-click bootstrap.
function PackerTool.load(self)
  vim.cmd "packadd packer.nvim"
  return self
end

--- install_autosync creates autocommand to trigger packer.sync() on plugins
--- defintion file edit.
-- @param plugins_file string: Plugin defintion file name.
function PackerTool.install_autosync(self, plugins_file)
  vim.cmd(string.format([[
    augroup packer_autosync
      autocmd!
      autocmd BufWritePost %s source <afile> | PackerSync
    augroup end
  ]], plugins_file))
  return self
end

--- is_bootstrap returns true if packer.nvim was installed during this load
--- of the init.lua.
function PackerTool.is_bootstrap(self)
  return self.BOOTSTRAP ~= 0
end

return PackerTool
