return {
	"romgrk/barbar.nvim",
	lazy = false,
	version = "*",
	dependencies = {
		"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
		"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
	},
	opts = {
		tabpages = false,
		clickable = true,
		sidebar_filetypes = {
			["neo-tree"] = true,
		},
	},
	keys = {
		{ "<Tab>", "<cmd> BufferNext <CR>", mode = "n", desc = "Next Tab" },
		{ "<S-Tab>", "<cmd> BufferPrevious <CR>", mode = "n", desc = "Prev Tab" },

		{ "<leader>bq", "<cmd>BufferClose<CR>", mode = "n", desc = "Quit" },
		{ "<leader>br", "<cmd>BufferRestore<CR>", mode = "n", desc = "Restore" },
		{ "<leader>bp", "<cmd>BufferPin<CR>", mode = "n", desc = "Pin/Unpin" },
		{ "<leader>b>", "<cmd>BufferMoveNext<CR>", mode = "n", desc = "Move Next" },
		{ "<leader>b<", "<cmd>BufferMovePrevious<CR>", mode = "n", desc = "Move Previous" },
		{ "<leader>bc", "<cmd>BufferCloseAllButCurrent<CR>", mode = "n", desc = "Close All But Current" },
		{ "<leader>bf", "<cmd>set ft?<CR>", mode = "n", desc = "Filetype" },
		{ "<C-q>", "<cmd>BufferClose<CR>", mode = "n", desc = "Quit Tab" },
	},
}
