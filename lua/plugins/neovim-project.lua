return {
	"coffebar/neovim-project",
	opts = {
		projects = {
			"~/dev/nu/*",
			"~/dev/*",
			"~/dev/Greenhouse/*",
			"~/.config/nvim*",
			"~/.config/*tty*",
		},
		picker = {
			type = "fzf-lua",
		},
		dashboard_mode = true,
	},
	keys = {
		{ "<leader>p", "<cmd>NeovimProjectDiscover<CR>", desc = "Find project", mode = { "n" } },
	},
	init = function()
		vim.opt.sessionoptions:append("globals")
	end,
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "Shatur/neovim-session-manager" },
		{ "ibhagwan/fzf-lua", version = "*" },
	},
	lazy = false,
	priority = 100,
}
