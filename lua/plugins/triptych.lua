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
			extension_mappings = {
				["<c-f>"] = {
					mode = "n",
					fn = function(target, _)
						require("telescope.builtin").find_files({
							search_dirs = { target.path },
						})
					end,
				},
			},
		}, -- config options here
		keys = {
			{ "<leader>t", "<cmd>Triptych<CR>", desc = "Triptych" },
		},
	},
}
