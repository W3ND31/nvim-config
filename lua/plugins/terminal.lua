return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		lazy = false,
		opts = {
			open_mapping = [[<c-/>]],
			size = 30,
		},
		keys = {
			{
				"<C-t>",
				function()
					FloatToggle()
				end,
				mode = { "n", "t" },
				desc = "Float Terminal",
			},
			{
				"<C-n>",
				"<Cmd>TermNew<CR>",
				mode = { "n", "t" },
				desc = "New Terminal",
			},
		},
		config = function(_, opts)
			require("toggleterm").setup(opts)
			local Terminal = require("toggleterm.terminal").Terminal

			local float = Terminal:new({
				direction = "float",
				hidden = true,
			})

			function FloatToggle()
				float:toggle()
			end
		end,
	},
}
