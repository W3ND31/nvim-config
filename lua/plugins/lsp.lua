return {
	{
		"mason-org/mason-lspconfig.nvim",
		version = "*",
		opts = {
			ensure_installed = {
				"lua_ls",
				"clojure_lsp",
				"bashls",
				"vimls",
				"ts_ls",
				"cssls",
				"html",
				"bashls",
				"jsonls",
				"gh_actions_ls",
			},
			automatic_enable = true,
		},
		dependencies = {
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
				"neovim/nvim-lspconfig",
				version = "*",
				lazy = false,
				config = function()
					local capabilities = vim.lsp.protocol.make_client_capabilities()
					local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
					if ok then
						capabilities =
							vim.tbl_deep_extend("force", capabilities, cmp_lsp.default_capabilities())
					end

					vim.lsp.config("*", {
						capabilities = capabilities,
					})

					vim.lsp.config("clojure_lsp", {
						root_markers = {
							"project.clj",
							"deps.edn",
							"build.boot",
							"shadow-cljs.edn",
							".git",
							"bb.edn",
						},
					})

					vim.api.nvim_create_autocmd("LspAttach", {
						group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
						callback = function(event)
							local client = vim.lsp.get_client_by_id(event.data.client_id)
							if client and client.server_capabilities.documentHighlightProvider then
								vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
									buffer = event.buf,
									callback = vim.lsp.buf.document_highlight,
								})

								vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
									buffer = event.buf,
									callback = vim.lsp.buf.clear_references,
								})
							end
						end,
					})
				end,
			},
		},
	},
	{
		"mfussenegger/nvim-lint",
		opts = {
			events = { "BufWritePost", "BufReadPost", "InsertLeave" },
		},
		config = function()
			require("lint").linters_by_ft = {
				clojure = { "clj-kondo" },
				sh = { "shellcheck" },
				zsh = { "shellcheck" },
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				html = { "htmlhint" },
				json = { "jsonlint" },
				css = { "stylelint" },
				yaml = { "yamllint" },
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
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
}
