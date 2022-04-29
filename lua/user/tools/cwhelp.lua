local cwhelp = {}

--- help opens vim help pane for the word under the cursor, quoted.
function cwhelp.help(self)
  local word = vim.fn.expand("<cword>")
  local help_command = string.format("help '%s'", word)
  ok = pcall(vim.api.nvim_command, help_command)
  if not ok then
    local error_message = string.format("Sorry, no help for '%s'.", word)
    vim.notify_once(error_message, vim.log.levels.ERROR, {})
  end
end

--- install_command creates CwHelp vim command.
function cwhelp.install_command(self)
  vim.api.nvim_create_user_command("CwHelp", self.help, {})
end

--- install_keymap created keymap to CwHelp command.
function cwhelp.install_keymap(self)
  vim.keymap.set("n", "<leader>ch", ":CwHelp<CR>")
end

return cwhelp
