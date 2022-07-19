local lua = require("lspconfig").sumneko_lua
local setup = require "user.plugins.options.lsp.setup"

lua.setup{
  on_attach = setup.on_attach,
  flags = {
    -- This will be the default in neovim 0.7+
    debounce_text_changes = 150,
  },
}
