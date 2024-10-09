-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- ~/.vim/filetype.lua

vim.filetype.add({
  pattern = {
    ["${NU_HOME}/.*/resources/.*_config.edn.base"] = "clojure",
    ["${NU_HOME}/.*/resources/.*_config.json.base"] = "json",
  },
})
vim.b.autoformat = false
