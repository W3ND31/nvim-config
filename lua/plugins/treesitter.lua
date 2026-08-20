return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"clojure",
			"lua",
			"luadoc",
			"luap",
			"vim",
			"vimdoc",
		},
		highlight = {
			enable = true,
		},
		indent = { enable = true },
		auto_install = true,
	},
	dependencies = {
		{ "OXY2DEV/markview.nvim" },
	},
}
