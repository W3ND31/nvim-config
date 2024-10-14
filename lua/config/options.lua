vim.g.maplocalleader = ","
vim.filetype.add({
  pattern = {
    ["${NU_HOME}/.*/resources/.*_config.edn.base"] = "clojure",
    ["${NU_HOME}/.*/resources/.*_config.json.base"] = "json",
  },
})
vim.g["conjure#client#clojure#nrepl#test#current_form_names"] =
  { "deftest", "defflow", "defspec", "defflow-i18n", "defflow-mx", "defflow-co" }
