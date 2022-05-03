  treesitter = require "nvim-treesitter.configs"

  treesitter.setup {
    ensure_installed = { "c", "lua" },
    highlight = { enable = true },
    incremental_selection = { enable = true },
    textobjects = { enable = true },
  }
