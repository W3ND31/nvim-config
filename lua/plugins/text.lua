return {
	{
		"gbprod/substitute.nvim",
		opts = {},
		config = function(opts)
			require("substitute").setup(opts)

			vim.keymap.set("n", "s", require("substitute").operator, { desc = "s" })
			vim.keymap.set("n", "ss", require("substitute").line, { desc = "s" })
			vim.keymap.set("n", "S", require("substitute").eol, { desc = "s" })
			vim.keymap.set("x", "s", require("substitute").visual, { desc = "s" })
		end,
	},
	{
		"gbprod/yanky.nvim",
		keys = {
			{
				"p",
				"<Plug>(YankyPutAfter)",
				mode = { "n", "x" },
				desc = "Paste After (Yanky)",
			},
			{
				"P",
				"<Plug>(YankyPutBefore)",
				mode = { "n", "x" },
				desc = "Paste Before (Yanky)",
			},
			{
				"gp",
				"<Plug>(YankyGPutAfter)",
				mode = { "n", "x" },
				desc = "Paste After and Jump to End (Yanky)",
			},
			{
				"gP",
				"<Plug>(YankyGPutBefore)",
				mode = { "n", "x" },
				desc = "Paste Before and Jump to End (Yanky)",
			},
			{
				"<c-n>",
				"<Plug>(YankyPreviousEntry)",
				mode = "n",
				desc = "Next Yanky History Entry",
			},
			{
				"<c-p>",
				"<Plug>(YankyNextEntry)",
				mode = "n",
				desc = "Previous Yanky History Entry",
			},
		},
		opts = {
			ring = {
				history_length = 100,
				storage = "shada",
				sync_with_numbered_registers = true,
				cancel_event = "update",
				ignore_registers = { "_" },
				update_register_on_cycle = false,
				permanent_wrapper = nil,
			},
			system_clipboard = {
				sync_with_ring = true,
			},
		},
	},
	{
		"altermo/ultimate-autopair.nvim",
		event = { "InsertEnter", "CmdlineEnter" },
		branch = "v0.6",
		opts = {},
	},
	{
		"kevinhwang91/nvim-ufo",
		version = "*",
		opts = {},
		dependencies = {
			{
				"kevinhwang91/promise-async",
				version = "*",
			},
		},
		config = function(opts)
			local ufo = require("ufo")

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true,
			}
			local language_servers = vim.lsp.get_clients() -- or list servers manually like {'gopls', 'clangd'}
			for _, ls in ipairs(language_servers) do
				require("lspconfig")[ls].setup({
					capabilities = capabilities,
					-- you can add other fields for setting up lsp server in this table
				})
			end

			vim.keymap.set("n", "zR", ufo.openAllFolds)
			vim.keymap.set("n", "zM", ufo.closeAllFolds)

			ufo.setup(opts)
		end,
	},
}
