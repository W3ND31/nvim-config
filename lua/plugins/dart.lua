return {
	"nvim-flutter/flutter-tools.nvim",
	lazy = true,
	ft = { "dart" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim", -- optional for vim.ui.select
	},
	opts = {
		flutter_lookup_cmd = "asdf where flutter",
	},
}

