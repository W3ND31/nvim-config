return {
	"coffebar/neovim-project",
	lazy = false,
	priority = 100,
	opts = {
		projects = {
			"~/dev/nu/*",
			"~/dev/nu/mini-meta-repo/stormguild",
			"~/dev/nu/mini-meta-repo/packages/credit_card/bill_details",
			"~/dev/nu/mini-meta-repo/packages/credit_card/credit_card",
			"~/dev/nu/mini-meta-repo/packages/tx_details/",
			"~/dev/*",
			"~/dev/Greenhouse/*",
			"~/.config/nvim*",
			"~/.config/*tty*",
			"~/stow/*",
		},
		picker = {
			type = "telescope", -- or "fzf-lua"
			preview = {
				enabled = true, -- show directory structure in Telescope preview
				git_status = true, -- show branch name, an ahead/behind counter, and the git status of each file/folder
				git_fetch = true, -- fetch from remote, used to display the number of commits ahead/behind, requires git authorization
				show_hidden = true, -- show hidden files/folders
			},
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
}
