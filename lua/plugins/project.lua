return {
	"coffebar/neovim-project",
	lazy = false,
	priority = 100,
	opts = {
		projects = {
			"~/dev/nu/*",
			"~/dev/nu/mini-meta-repo/stormguild/",
			"~/repos/*",
			"~/stow",
			"~/dev/Greenhouse/*",
			"~/*.zshrc",
			"~/*.nurc",
			"~/.config/*",
		},
		picker = {
			type = "snacks", -- or "fzf-lua"
		},
		datapath = "~/.config/neovim-project",
		follow_symlinks = "none",
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
	},
}
