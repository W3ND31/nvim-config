return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		opts = {
			panel = {
				enabled = false,
			},
			suggestion = {
				enabled = false,
			},
			filetypes = {
				markdown = true,
				help = true,
			},
		},
	},
	{
		"editor-code-assistant/eca-nvim",
		-- dir = "~/repos/eca-nvim",
		opts = {
			debug = true,
		},
		keys = {
			{
				"<leader>a",
				desc = "ECA",
			},
			{
				"<leader>as",
				"<cmd>EcaServerStatus<cr>",
				desc = "Server Status",
			},
			{
				"<leader>aS",
				"<cmd>EcaServerStop<cr>",
				desc = "Server Stop",
			},
			{
				"<leader>ai",
				"<cmd>EcaServerStart<cr>",
				desc = "Server Init",
			},
			{
				"<leader>ar",
				"<cmd>EcaServerRestart<cr>",
				desc = "Server Restart",
			},
			{
				"<leader>aa",
				"<cmd>EcaAddFile<cr>",
				desc = "Add File",
			},
			{
				"<leader>ac",
				"<cmd>EcaChat<cr>",
				desc = "Chat",
			},
			{
				"<leader>aC",
				"<cmd>EcaClose<cr>",
				desc = "Close Chat",
			},
			{
				"<leader>af",
				"<cmd>EcaFocus<cr>",
				desc = "Focus",
			},
			{
				"<leader>at",
				"<cmd>EcaToggle<cr>",
				desc = "toggle",
			},
			{
				"<leader>aa",
				"<cmd>EcaAddSelection<cr>",
				mode = "v",
				desc = "Add Selection",
			},
		},
		dependencies = {},
	},
}
