---@diagnostic disable-next-line: different-requires
local lazy = require("lazy")

return {
	{ "lewis6991/gitsigns.nvim" },
	{ "nvim-tree/nvim-web-devicons" },
	{ "MunifTanjim/nui.nvim", version = "*" },
	{
		"nvim-lua/plenary.nvim",
		lazy = true,
	},
	{
		"stevearc/dressing.nvim",
		lazy = true,
		init = function()
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.select = function(...)
				lazy.load({ plugins = { "dressing.nvim" } })
				return vim.ui.select(...)
			end
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.input = function(...)
				lazy.load({ plugins = { "dressing.nvim" } })
				return vim.ui.input(...)
			end
		end,
	},
	{
		"nvimdev/indentmini.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	},
	{
		"HiPhish/rainbow-delimiters.nvim",
	},
	{
		"arnamak/stay-centered.nvim",
		enabled = false,
		lazy = false,
		opts = {
			enabled = true,
			allow_scroll_move = true,
			disable_on_mouse = true,
		},
	},
}
