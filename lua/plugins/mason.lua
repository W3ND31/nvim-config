return {
	{
		"williamboman/mason.nvim",
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
		"williamboman/mason-lspconfig.nvim",
		opts = {
			automatic_installation = true,
			ensure_installed = {
				"lua_ls",
				"clojure_lsp",
				"bashls",
				-- "dartls",
				"ast_grep",
				"vimls",
			},
			handlers = {
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup({})
				end,
			},
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"bash-language-server",
				"clj-kondo",
				"clojure-lsp",
				"cljfmt",
				"lua-language-server",
				"vim-language-server",
				"luacheck",
				"shellcheck",
				"shfmt",
				"stylua",
				"ast-grep",
			},
			auto_update = true,
			debounce_hours = 5,
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
			}
		end,
	},
}
