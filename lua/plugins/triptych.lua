return {
	{
		"simonmclean/triptych.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"nvim-tree/nvim-web-devicons", -- optional for icons
			"antosha417/nvim-lsp-file-operations", -- optional LSP integration
		},
		opts = {
			mappings = {
				toggle_hidden = "H",
			},
			options = {
				show_hidden = true,
			},
			git_signs = {
				enabled = true,
				signs = {
					add = " ",
					modify = " ",
					rename = "r",
					untracked = " ",
				},
			},
		}, -- config options here
		keys = {
			{ "<leader>e", "<cmd>Triptych<CR>", desc = "File Explorer" },
		},
	},
}
