local function cwhelp(_)
  local word = vim.call("expand", "<cword>")
  local help_command = string.format("help '%s'", word)
  ok = pcall(vim.api.nvim_command, help_command)
  if not ok then
    local error_message = string.format("Sorry, no help for '%s'", word)
    vim.notify_once(error_message, vim.log.levels.ERROR, {})
  end
end
vim.api.nvim_create_user_command("CwHelp", cwhelp, {})
vim.keymap.set("n", "<leader>ch", ":CwHelp<CR>")
