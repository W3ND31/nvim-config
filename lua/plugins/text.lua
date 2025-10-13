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
	-- {
	-- 	"kevinhwang91/nvim-ufo",
	-- 	version = "5b75cf5fdb74054fc8badb2e7ca9911dc0470d94",
	-- 	opts = {
	-- 		fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
	-- 			local newVirtText = {}
	-- 			local suffix = (" 󰁂 %d "):format(endLnum - lnum)
	-- 			local sufWidth = vim.fn.strdisplaywidth(suffix)
	-- 			local targetWidth = width - sufWidth
	-- 			local curWidth = 0
	-- 			for _, chunk in ipairs(virtText) do
	-- 				local chunkText = chunk[1]
	-- 				local chunkWidth = vim.fn.strdisplaywidth(chunkText)
	-- 				if targetWidth > curWidth + chunkWidth then
	-- 					table.insert(newVirtText, chunk)
	-- 				else
	-- 					chunkText = truncate(chunkText, targetWidth - curWidth)
	-- 					local hlGroup = chunk[2]
	-- 					table.insert(newVirtText, { chunkText, hlGroup })
	-- 					chunkWidth = vim.fn.strdisplaywidth(chunkText)
	-- 					if curWidth + chunkWidth < targetWidth then
	-- 						suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
	-- 					end
	-- 					break
	-- 				end
	-- 				curWidth = curWidth + chunkWidth
	-- 			end
	-- 			table.insert(newVirtText, { suffix, "MoreMsg" })
	-- 			return newVirtText
	-- 		end,
	-- 	},
	-- 	dependencies = {
	-- 		{
	-- 			"kevinhwang91/promise-async",
	-- 			version = "*",
	-- 		},
	-- 		{
	-- 			"luukvbaal/statuscol.nvim",
	-- 			config = function()
	-- 				local builtin = require("statuscol.builtin")
	-- 				require("statuscol").setup({
	-- 					relculright = true,
	-- 					segments = {
	-- 						{ text = { builtin.foldfunc }, click = "v:lua.ScFa" },
	-- 						{ text = { "%s" }, click = "v:lua.ScSa" },
	-- 						{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
	-- 					},
	-- 				})
	-- 			end,
	-- 		},
	-- 	},
	-- 	config = function(opts)
	-- 		local ufo = require("ufo")
	--
	-- 		local capabilities = vim.lsp.protocol.make_client_capabilities()
	-- 		capabilities.textDocument.foldingRange = {
	-- 			dynamicRegistration = false,
	-- 			lineFoldingOnly = true,
	-- 		}
	-- 		local language_servers = vim.lsp.get_clients() -- or list servers manually like {'gopls', 'clangd'}
	-- 		for _, ls in ipairs(language_servers) do
	-- 			require("lspconfig")[ls].setup({
	-- 				capabilities = capabilities,
	-- 				-- you can add other fields for setting up lsp server in this table
	-- 			})
	-- 		end
	--
	-- 		vim.keymap.set("n", "zR", ufo.openAllFolds)
	-- 		vim.keymap.set("n", "zM", ufo.closeAllFolds)
	--
	-- 		ufo.setup(opts)
	-- 	end,
	-- },
	{
		"numToStr/Comment.nvim",
		opts = {
			---Add a space b/w comment and the line
			padding = true,
			---Whether the cursor should stay at its position
			sticky = true,
			---Lines to be ignored while (un)comment
			ignore = nil,
			---LHS of toggle mappings in NORMAL mode
			toggler = {
				---Line-comment toggle keymap
				line = "gcc",
				---Block-comment toggle keymap
				block = "gbc",
			},
			---LHS of operator-pending mappings in NORMAL and VISUAL mode
			opleader = {
				---Line-comment keymap
				line = "gc",
				---Block-comment keymap
				block = "gb",
			},
			---LHS of extra mappings
			extra = {
				---Add comment on the line above
				above = "gcO",
				---Add comment on the line below
				below = "gco",
				---Add comment at the end of line
				eol = "gce",
			},
			---Enable keybindings
			---NOTE: If given `false` then the plugin won't create any mappings
			mappings = {
				---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
				basic = true,
				---Extra mapping; `gco`, `gcO`, `gcA`
				extra = true,
			},
			---Function to call before (un)comment
			pre_hook = nil,
			---Function to call after (un)comment
			post_hook = nil,
		},
	},
}
