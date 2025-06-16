return {
	"nvim-lualine/lualine.nvim",
	version = "*",
	enabled = true,
	lazy = false,
	event = { "BufReadPost", "BufNewFile", "VeryLazy" },
	opts = {
		options = {
			theme = "auto",
			globalstatus = true,
			icons_enabled = true,
			refresh = {
				statusline = 100,
			},
		},
		sections = {
			lualine_a = {
				{
					"fancy_mode",
				},
			},
			lualine_b = {
				"fancy_branch",
				"fancy_diff",
			},
			lualine_c = {
				{
					"fancy_cwd",
					substitute_home = true,
				},
				{
					"fancy_diagnostics",
					sources = { "nvim_lsp" },
					symbols = { error = " ", warn = " ", info = " " },
				},
			},
			lualine_x = {
				"fancy_lsp_servers",
				{ "fancy_macro" },
				{ "fancy_searchcount" },
			},
			lualine_y = {
				{ "fancy_filetype", ts_icon = "" },
			},
			lualine_z = {
				{ "fancy_location" },
			},
		},
		tabline = {},
		extensions = { "neo-tree", "lazy", "toggleterm", "mason" },
	},
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"meuter/lualine-so-fancy.nvim",
	},
}
