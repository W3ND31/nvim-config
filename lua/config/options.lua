-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.maplocalleader = ","
vim.filetype.add({
    pattern = {
        ["${NU_HOME}/.*/resources/.*_config.edn.base"] = "clojure",
        ["${NU_HOME}/.*/resources/.*_config.json.base"] = "json",
    },
})
vim.g["conjure#client#clojure#nrepl#test#current_form_names"] =
{ "deftest", "defflow", "defspec", "defflow-i18n", "defflow-mx", "defflow-co" }
