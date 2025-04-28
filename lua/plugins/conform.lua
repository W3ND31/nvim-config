return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			clojure = { "cljfmt" },
			sh = { "shfmt" },
			dart = { "ast_grep" },
		},
		notify_on_error = true,
		notify_no_formatters = true,
	},
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format()
			end,
			mode = { "n", "v" },
			desc = "Format",
		},
		{
			"È", -- Personal keymap because EurKey (Shift + Alt + f => È)
			function()
				require("conform").format()
			end,
			mode = { "n", "v" },
			desc = "Format",
		},
	},
}
