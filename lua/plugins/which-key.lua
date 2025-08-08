return {
	"folke/which-key.nvim",
	version = "*",
	event = "VeryLazy",
	opts = {
		preset = "modern",
		icons = {
			group = "",
		},
		spec = {
			mode = { "n", "v" },
			--groups
			{ "<leader>", group = "Leader" },
			{ "<leader>f", group = "Find/Files" },
			{ "<leader>b", group = "Buffer" },
			{ "<leader>g", group = "Git" },
			{ "<leader>c", group = "Code" },
			{ "<leader>n", group = "Noice" },
			{ "<leader>q", group = "Quit" },
			{ "<leader>w", group = "Windows" },
			{ "<leader>s", group = "Search" },
			{ "<leader>r", group = "Repl" },
			{ "<leader>x", group = "Trouble", icon = "" },
			{ "<leader>u", group = "Ui" },
			{ "<leader><TAB>", group = "Tab" },

			-- LocalLeader
			{ "<localleader>", group = "Local Leader" },
			{
				"<localleader>c",
				group = "Connection",
				icon = {
					icon = "",
					color = "azure",
				},
			},
			{
				"<localleader>e",
				group = "Evaluate",
				icon = {
					icon = "󰞷",
					color = "azure",
				},
			},
			{
				"<localleader>l",
				group = "Log",
				icon = {
					icon = "",
					color = "blue",
				},
			},
			{
				"<localleader>g",
				group = "Goto",
				icon = {
					icon = "",
					color = "cyan",
				},
			},
			{
				"<localleader>r",
				group = "Refresh",
				icon = {
					icon = "",
					color = "green",
				},
			},
			{
				"<localleader>s",
				group = "Session",
				icon = {
					icon = "",
					color = "orange",
				},
			},
			{
				"<localleader>t",
				group = "Test",
				icon = {
					icon = "󰙨",
					color = "red",
				},
			},
			{
				"<localleader>v",
				group = "View",
				icon = {
					icon = "",
					color = "yellow",
				},
			},
			{
				"<localleader>x",
				group = "eXecute",
				icon = {
					icon = "󱜧",
					color = "purple",
				},
			},

			{ "gs", group = "Surround" },
			{ "g", group = "Goto" },
			{ "z", group = "Fold" },
			{ "gx", desc = "Open with system app" },
		},
	},
	keys = {
		{
			"<c-w><space>",
			function()
				require("which-key").show({ keys = "<c-w>", loop = true })
			end,
			desc = "Window Hydra Mode (which-key)",
		},
	},
	dependencies = {
		{
			"echasnovski/mini.icons",
			"nvim-tree/nvim-web-devicons",
		},
	},
}
