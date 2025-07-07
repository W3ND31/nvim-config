return {
	{
		"stevearc/conform.nvim",
		version = "*",
		lazy = true,
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				-- beautysh
				-- sh = { "beautysh" },
				-- zsh = { "beautysh" },
				--prettier
				-- javascript = { "prettier" },
				-- typescript = { "prettier" },
				-- html = { "prettier" },
				-- json = { "prettier" },
				-- css = { "prettier" },
			},
			notify_on_error = true,
			notify_no_formatters = true,
			default_format_opts = {
				lsp_format = "fallback",
			},
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
					vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
				end,
				mode = { "n", "v", "i" },
				desc = "Format",
			},
		},
	},
	{
		"zapling/mason-conform.nvim",
		opts = {
			ignore_install = {},
		},
	},
}

