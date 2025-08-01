return {
	"folke/noice.nvim",
	event = "VeryLazy",
	keys = {
		{ "<leader>nh", "<cmd>NoiceHistory<cr>", desc = "History" },
	},
	opts = {
		views = {
			cmdline_popup = {
				border = {
					padding = { 0, 0 },
				},
			},
		},
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		presets = {
			bottom_search = false,
			command_palette = true,
			long_message_to_split = true,
			inc_rename = false,
			lsp_doc_border = true,
		},
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
}
