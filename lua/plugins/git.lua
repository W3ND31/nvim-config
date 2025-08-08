return {
	{
		"Yu-Leo/blame-column.nvim",
		opts = {}, -- for default options. Refer to the configuration section for custom setup.
		cmd = "BlameColumnToggle",
		keys = {
			{ "<leader>gb", "<cmd>BlameColumnToggle<cr>", desc = "Toggle Blame Column" },
		},
	},
}
