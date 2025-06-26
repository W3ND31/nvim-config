return {
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

		-- History Navigation
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
			storage = "sqlite",
			sync_with_numbered_registers = true,
			cancel_event = "update",
			ignore_registers = { "_" },
			update_register_on_cycle = false,
			permanent_wrapper = nil,
		},
		system_clipboard = {
			sync_with_ring = true,
		},
		highlight = {
			on_put = true,
			on_yank = true,
			timer = 300,
		},
	},
	dependencies = {
		{ "kkharji/sqlite.lua" },
	},
}
