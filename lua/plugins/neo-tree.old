return {
	{
		"antosha417/nvim-lsp-file-operations",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("lsp-file-operations").setup()
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			{ "3rd/image.nvim", opts = {} },
			{
				"s1n7ax/nvim-window-picker",
				version = "2.*",
				config = function()
					require("window-picker").setup({
						filter_rules = {
							include_current_win = false,
							autoselect_one = true,
							bo = {
								filetype = { "neo-tree", "neo-tree-popup", "notify" },
								buftype = { "terminal", "quickfix" },
							},
						},
					})
				end,
			},
		},
		lazy = false,
		opts = {
			close_if_last_window = false,
			enable_git_status = true,
			enable_diagnostics = true,
			hide_root_node = true,
			retain_hidden_root_indent = true,
			filesystem = {
				filtered_items = {
					show_hidden_count = false,
					never_show = {
						".DS_Store",
					},
				},
				follow_current_file = {
					enabled = true,
					leave_dirs_open = false,
				},
				group_empty_dirs = false,
				hijack_netrw_behavior = "open_default",
				use_libuv_file_watcher = false,
			},
			default_component_configs = {
				indent = {
					with_expanders = true,
					expander_collapsed = "",
					expander_expanded = "",
				},
			},
		},
		keys = {
			{ "<leader>e", "<cmd>Neotree toggle<CR>", desc = "File Explorer" },
		},
		config = function()
			vim.diagnostic.config({
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "",
						[vim.diagnostic.severity.WARN] = "",
						[vim.diagnostic.severity.INFO] = "",
						[vim.diagnostic.severity.HINT] = "󰌵",
					},
				},
			})
		end,
	},
}
