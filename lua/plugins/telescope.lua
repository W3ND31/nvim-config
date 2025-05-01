return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-telescope/telescope-fzf-native.nvim",
	},
	opts = {
		defaults = {
			sorting_strategy = "ascending",
			layout_config = {
				horizontal = { prompt_position = "bottom" },
			},
		},
	},
	keys = {
		{ "<leader> ", "<cmd>Telescope find_files<CR>", mode = { "n" }, desc = "Find Files" },
		-- git
		{ "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "Commits" },
		{ "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "Status" },
		-- search
		{ "<leader>sp", "<cmd>Telescope live_grep<CR>", mode = { "n" }, desc = "Find in Project" },
		{ "<leader>sr", "<cmd>Telescope registers<cr>", desc = "Registers" },
		{ "<leader>so", "<cmd>Telescope oldfiles<CR>", mode = { "n" }, desc = "Old Files" },
		{ "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
		{ "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
		{ "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
		{ "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
		{ "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document Diagnostics" },
		{ "<leader>sD", "<cmd>Telescope diagnostics<cr>", desc = "Workspace Diagnostics" },
		{ "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
		{ "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
		{ "<leader>sj", "<cmd>Telescope jumplist<cr>", desc = "Jumplist" },
		{ "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
		{ "<leader>sl", "<cmd>Telescope loclist<cr>", desc = "Location List" },
		{ "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
		{ "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
		{ "<leader>sv", "<cmd>Telescope vim_options<cr>", desc = "Options" },
		{ "<leader>sq", "<cmd>Telescope quickfix<cr>", desc = "Quickfix List" },
		-- ui
		{ "<leader>uC", "<cmd>Telescope colorscheme", desc = "Colorscheme with Preview" },
		{ "gr", "<cmd>Telescope lsp_references<cr>", mode = { "n" }, desc = "References" },
		{
			"gd",
			function()
				require("telescope.builtin").lsp_definitions({ reuse_win = true })
			end,
			desc = "Goto Definition",
		},
		{
			"gI",
			function()
				require("telescope.builtin").lsp_implementations({ reuse_win = true })
			end,
			desc = "Goto Implementation",
		},
		{
			"gy",
			function()
				require("telescope.builtin").lsp_type_definitions({ reuse_win = true })
			end,
			desc = "Goto T[y]pe Definition",
		},
	},
}
