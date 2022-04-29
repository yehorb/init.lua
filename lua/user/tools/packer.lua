local packer_tool = {}

packer_tool.AUGROUP = "packer_autosync"
packer_tool.BOOTSTRAP = 0
packer_tool.INSTALL_MESSAGE = (
  "Installed packer.nvim. Restart Neovim to correctly load plugins."
)
packer_tool.INSTALL_PATH = "site/pack/packer/opt/packer.nvim"
packer_tool.REPOSITORY = "https://github.com/wbthomason/packer.nvim"

function packer_tool.ensure_install(self)
  if self:is_installed() then
    return self
  end
  self:install()
  vim.notify(self.INSTALL_MESSAGE, vim.log.levels.WARN, {})
  return self
end

function packer_tool.is_installed(self)
  return vim.fn.empty(vim.fn.glob(self:install_path())) ~= 1
end

function packer_tool.install_path(self)
  return string.format("%s/%s", vim.fn.stdpath("data"), self.INSTALL_PATH)
end

--- install clones packer.nvim git repository into the expected installation
--- directory.
function packer_tool.install(self)
  self.BOOTSTRAP = vim.fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    self.REPOSITORY,
    self:install_path()
  }
end

function packer_tool.packadd(self)
  vim.cmd "packadd packer.nvim"
  return self
end

--- install_autosync creates autocommand to trigger packer.sync() on plugins
--- defintion file edit.
-- @param plugins_file string: Plugin defintion file name.
function packer_tool.install_autosync(self, plugins_file)
  vim.api.nvim_create_augroup(self.AUGROUP, { clear = true })
  vim.api.nvim_create_autocmd("BufWritePost", {
      group = self.AUGROUP,
      pattern = plugins_file,
      command = "source <afile> | PackerSync",
  })
  return self
end

function packer_tool.is_bootstrap(self)
  return self.BOOTSTRAP ~= 0
end

return packer_tool
