return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	version = "*",
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
			use_languagetree = true,
		},
		indent = { enable = true },
		auto_install = true,
	},
	config = function(_, opts)
		---@diagnostic disable-next-line: missing-fields
		require("nvim-treesitter.configs").setup(opts)
	end,
	dependencies = {
		{ "OXY2DEV/markview.nvim" },
	},
}
