return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "modern",
		win = {
			no_overlap = false,
		},
		spec = {
			-- Groups
			{ "<leader>f", group = "File" },
			{ "<leader>q", group = "Quit" },
			{ "<leader>c", group = "Code" },
			{ "<leader>x", group = "Trouble" },
			{ "g", group = "Goto" },
			{ "z", group = "Folds" },
			{ " ", group = "Leader" },
			{ ",", group = "LocalLeader" },
			{ "<leader>w", group = "Window" },
			{ "<c-w>", group = "Window" },
			-- Mappings
			{ "<leader>fn", desc = "New File" },
			{ "gs", desc = "Mini-Surround" },
			{
				"<leader>w",
				desc = "Windows",
				proxy = "<c-w>",
			},
			-- New Mappings
			{ "<leader> ", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
			{ "<leader>l", "<cmd>Lazy<cr>", desc = "Lazy", mode = "n" },
			{ "<leader>p", "<cmd>NeovimProjectDiscover<cr>", desc = "Projects", mode = "n" },
			{ "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" },
			{ "<leader>cl", "<cmd>LspInfo<cr>", desc = "LspInfo" },
			{ "<leader>qq", "<cmd>qa<cr>", desc = "Quit", mode = { "n", "v" } }, -- no need to specify mode since it's inherited
			{
				"<leader>b",
				group = "Buffers",
				expand = function()
					return require("which-key.extras").expand.buf()
				end,
			},
		},
	},
}
