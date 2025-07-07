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
		"HiPhish/rainbow-delimiters.nvim",
	},
}
