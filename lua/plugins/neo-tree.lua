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
			"saifulapm/neotree-file-nesting-config",
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
		keys = {
			{ "<leader>e", "<cmd>Neotree toggle<CR>", desc = "File Explorer" },
		},
		opts = {
			close_if_last_window = false,
			enable_git_status = true,
			enable_diagnostics = true,
			hide_root_node = true,
			retain_hidden_root_indent = true,
			popup_border_style = "NC",
			filesystem = {
				window = {
					mappings = {
						["o"] = "open_and_clear_filter",
					},
				},
				filtered_items = {
					visible = true,
					hide_hidden = false,
					show_hidden_count = false,
					never_show = {
						".DS_Store",
					},
					hide_by_pattern = {
						"*.DS_Store",
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
				git_status = {
					symbols = {
						-- Change type
						added = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
						modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
						deleted = "✖", -- this can only be used in the git_status source
						renamed = "󰁕", -- this can only be used in the git_status source
						-- Status type
						untracked = "",
						ignored = "",
						unstaged = "󰄱",
						staged = "",
						conflict = "",
					},
				},
			},
			window = {
				mappings = {
					["<space>"] = "none",
					["e"] = function()
						vim.api.nvim_exec("Neotree focus filesystem", true)
					end,
					["b"] = function()
						vim.api.nvim_exec("Neotree focus buffers", true)
					end,
					["g"] = function()
						vim.api.nvim_exec("Neotree focus git_status", true)
					end,
				},
			},
			-- source_selector = {
			-- 	winbar = true,
			-- 	statusline = false,
			-- },
			commands = {
				open_and_clear_filter = function(state)
					local node = state.tree:get_node()
					if node and node.type == "file" then
						local file_path = node:get_id()
						-- reuse built-in commands to open and clear filter
						local cmds = require("neo-tree.sources.filesystem.commands")
						cmds.open(state)
						cmds.clear_filter(state)
						-- reveal the selected file without focusing the tree
						require("neo-tree.sources.filesystem").navigate(state, state.path, file_path)
					end
				end,
			},
		},
		config = function(_, opts)
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
			opts.nesting_rules = require("neotree-file-nesting-config").nesting_rules
			require("neo-tree").setup(opts)
		end,
	},
}
