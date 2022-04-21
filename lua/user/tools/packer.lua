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
-- @param packer packer: Loaded packer.nvim module.
-- @param plugins_file string: Plugin defintion file name.
function M.install_autosync(packer, plugins_file)
  local group_name = "packer_refresh"
  vim.api.nvim_create_augroup(group_name, { clear = true })
  vim.api.nvim_create_autocmd("BufWritePost", {
    group = group_name,
    pattern = plugins_file,
    desc = "Trigger packer.sync() on plugins defintion file edit.",
    callback = function(event)
      packer.reset()
      vim.cmd(string.format("luafile %s", event.file))
      packer.sync()
    end
  })
end

return M
