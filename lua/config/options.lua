local o = vim.o

vim.g.mapleader = " "
vim.g.maplocalleader = ","

o.laststatus = 3 -- global statusline
o.showmode = false

o.clipboard = "unnamedplus"

-- Indenting
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2

o.ignorecase = true
o.smartcase = true
o.mouse = "a"

o.number = true

o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.termguicolors = true
o.timeoutlen = 400
o.undofile = true
o.cursorline = true

vim.api.nvim_set_hl(0, "IndentLine", { link = "Comment" })

-- Nu
vim.filetype.add({
	pattern = {
		["${NU_HOME}/.*/resources/.*_config.edn.base"] = "clojure",
		["${NU_HOME}/.*/resources/.*_config.json.base"] = "json",
    ["${HOME}/.nurc"] = "bash",
    ["${HOME}/stow/nu/.nurc"] = "bash",
		["${HOME}/.zshrc"] = "bash",
		["${HOME}/.bashrc"] = "bash",
	},
})

vim.g["conjure#client#clojure#nrepl#test#current_form_names"] =
	{ "deftest", "defflow", "defspec", "defflow-i18n", "defflow-mx", "defflow-co" }

vim.opt.wrap = true
vim.g.autoformat = false

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.diagnostic.config({ virtual_text = true })
vim.opt.relativenumber = true

-- Fold options
vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
