return {
	{
		"mason-org/mason.nvim",
		build = ":MasonUpdate",
		cmd = { "Mason", "MasonInstall" },
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
		keys = {
			{ "<leader>cm", "<cmd>Mason<CR>", desc = "Mason" },
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {},
			auto_update = true,
			debounce_hours = 5,
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"lua_ls",
				"clojure_lsp",
				"bashls",
				"ast_grep",
				"vimls",
				"eslint",
				"cssls",
				"html",
				"bashls",
				"jsonls",
			},
			handlers = {
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup({})
				end,
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
	},
	{
		"mfussenegger/nvim-lint",
		opts = {
			events = { "BufWritePost", "BufReadPost", "InsertLeave" },
		},
		config = function()
			require("lint").linters_by_ft = {
				clojure = { "clj-kondo" },
				lua = { "luacheck" },
				sh = { "shellcheck" },
				zsh = { "shellcheck" },
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				html = { "htmlhint" },
				json = { "jsonlint" },
				css = { "stylelint" },
			}
		end,
	},
	{
		"W3ND31/mason-nvim-lint",
		opts = {
			automatic_installation = true,
		},
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				clojure = { "cljfmt" },
				dart = { "ast_grep" },
				-- beautysh
				sh = { "beautysh" },
				zsh = { "beautysh" },
				--prettier
				javascript = { "prettier" },
				typescript = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				css = { "prettier" },
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
