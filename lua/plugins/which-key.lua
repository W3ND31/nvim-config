return {
	"folke/which-key.nvim",
	event = "VeryLazy",
  version = "*",
	opts = {
		preset = "modern",
		spec = {
			mode = { "n", "v" },
			--groups
			{ "<leader>", group = "Leader" },
			{ "<localleader>", group = "Local Leader" },
			{ "<leader>f", group = "Find/Files" },
			{ "<leader>b", group = "Buffer" },
			{ "<leader>g", group = "Git" },
			{ "<leader>c", group = "Code" },
			{ "<leader>q", group = "Quit" },
			{ "<leader>w", group = "Windows" },
			{ "<leader>s", group = "Search" },
			{ "<leader>x", group = "Trouble" },
			{ "<leader>u", group = "Ui" },
			{ "<leader><TAB>", group = "Tab" },
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
		{ "echasnovski/mini.icons" },
	},
}
