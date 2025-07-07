return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"lua_ls",
				"clojure_lsp",
				-- "bashls",
				-- "vimls",
				-- "ts_ls",
				-- "cssls",
				-- "html",
				-- "bashls",
				-- "jsonls",
				-- "gh_actions_ls",
			},
			handlers = {
				function(server_name)
					local capabilities = vim.lsp.protocol.make_client_capabilities()
					capabilities =
						vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

					local servers = {}

					local server = servers[server_name] or {}
					server.capabilities = capabilities

					require("lspconfig")[server_name].setup(server)
				end,
			},
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
					local function custom_clojure_root_dir(pattern)
						local util = require("lspconfig.util")
						local fallback = vim.loop.cwd()
						local patterns =
							{ "project.clj", "deps.edn", "build.boot", "shadow-cljs.edn", ".git", "bb.edn" }
						local root = util.root_pattern(patterns)(pattern)
						return (root or fallback)
					end
					require("lspconfig").clojure_lsp.setup({
						root_dir = custom_clojure_root_dir,
					})

					-- INFO: Ensure custom keymaps
					vim.api.nvim_create_autocmd("LspAttach", {
						group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
						callback = function(event)
							-- INFO: The following two autocommands are used to highlight references of the
							-- word under your cursor when your cursor rests there for a little while.
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
				lua = { "luacheck" },
				-- sh = { "shellcheck" },
				-- zsh = { "shellcheck" },
				-- javascript = { "eslint_d" },
				-- typescript = { "eslint_d" },
				-- html = { "htmlhint" },
				-- json = { "jsonlint" },
				-- css = { "stylelint" },
				-- yaml = { "yamllint" },
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
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
		version = "*",
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {
			completions = {
				lsp = { enabled = true },
			},
		},
	},
}

