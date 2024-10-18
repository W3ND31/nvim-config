return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"maxmx03/fluoromachine.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			glow = true,
			theme = "fluoromachine",
			transparent = false,
		},
        config = function()
			vim.cmd([[colorscheme fluoromachine]])
		end,
	},
}
