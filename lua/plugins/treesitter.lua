return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require('nvim-treesitter.configs')
    config.setup {
      ensure_installed = {
        "bash",
        "c",
        "clojure",
        "css",
        "dart",
        "diff",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "lua",
        "luadoc",
        "luap",
        "markdown_inline",
        "markdown",
        "printf",
        "python",
        "query",
        "regex",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
      },

      highlight = {
        enable = true,
        use_languagetree = true,
      },
      indent = { enable = true },
    }
  end
}
