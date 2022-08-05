local setup = require "user.plugins.options.lsp.setup"

local function get_cmd()
  local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
  if is_windows then
    return { "pwsh.exe", "-NoProfile", "-NonInteractive", "-Command", "lua-language-server.ps1" }
  else
    return nil
  end
end

require("lspconfig").sumneko_lua.setup {
  on_attach = setup.on_attach,
  flags = {
    -- This will be the default in neovim 0.7+
    debounce_text_changes = 150,
  },
  cmd = get_cmd(),
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
