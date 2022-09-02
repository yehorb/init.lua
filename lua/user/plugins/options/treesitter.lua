  local treesitter = require "nvim-treesitter.configs"

  treesitter.setup {
    ensure_installed = {
      "c",
      "cpp",
      "lua",
      "python",
      "sql",
    },
    highlight = { enable = true },
    incremental_selection = { enable = true },
    textobjects = { enable = true },
  }
