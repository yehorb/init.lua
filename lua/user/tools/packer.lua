local packer_tool = {}

local AUGROUP = "Packer"
local BOOTSTRAP = 0
local INSTALL_MESSAGE = (
  "Installed packer.nvim. Restart Neovim to correctly load plugins."
)
local INSTALL_PATH = "site/pack/packer/opt/packer.nvim"
local REPOSITORY = "https://github.com/wbthomason/packer.nvim"

function packer_tool.ensure_install(self)
  if self:is_installed() then
    return self
  end
  self:install()
  vim.notify(INSTALL_MESSAGE, vim.log.levels.WARN, {})
  return self
end

function packer_tool.is_installed(self)
  return vim.fn.empty(vim.fn.glob(self:install_path())) ~= 1
end

function packer_tool.install_path(self)
  return string.format("%s/%s", vim.fn.stdpath("data"), INSTALL_PATH)
end

--- install clones packer.nvim git repository into the expected installation
--- directory.
function packer_tool.install(self)
  BOOTSTRAP = vim.fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    REPOSITORY,
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
  vim.api.nvim_create_augroup(AUGROUP, { clear = true })
  vim.api.nvim_create_autocmd("BufWritePost", {
      group = AUGROUP,
      pattern = plugins_file,
      command = "source <afile> | PackerSync",
  })
  return self
end

function packer_tool.is_bootstrap(self)
  return BOOTSTRAP ~= 0
end

return packer_tool
