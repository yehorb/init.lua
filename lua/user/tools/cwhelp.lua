local M = {}

--- help opens vim help pane for the word under the cursor, quoted.
function M.help()
  local word = vim.fn.epand("<cword>")
  local help_command = string.format("help '%s'", word)
  ok = pcall(vim.api.nvim_command, help_command)
  if not ok then
    local error_message = string.format("Sorry, no help for '%s'", word)
    vim.notify_once(error_message, vim.log.levels.ERROR, {})
  end
end

--- install_command creates CwHelp vim command.
function M.install_command()
  vim.api.nvim_create_user_command("CwHelp", M.help, {})
end

--- install_keymap created keymap to CwHelp command.
function M.install_keymap()
  vim.keymap.set("n", "<leader>ch", ":CwHelp<CR>")
end

return M
