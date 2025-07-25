vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.o.laststatus = 3 -- global statusline
vim.o.showmode = false

vim.o.clipboard = "unnamedplus"

-- Indenting
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.smartindent = true
vim.o.tabstop = 2
vim.o.softtabstop = 2

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.mouse = "a"

vim.o.number = true

vim.o.signcolumn = "yes"
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.termguicolors = true
vim.o.timeoutlen = 300
vim.o.undofile = true
vim.o.cursorline = true

vim.api.nvim_set_hl(0, "IndentLine", { link = "Comment" })

-- Filetypes
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
vim.o.fillchars = [[eob: ,fold:…,foldopen:,foldsep: ,foldclose:]]
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
