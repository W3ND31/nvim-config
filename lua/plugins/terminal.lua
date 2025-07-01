return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		lazy = false,
		opts = {
			open_mapping = [[<c-/>]],
			size = 30,
			shell = "/bin/zsh",
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
			{
				"<leader>gg",
				function()
					LazygitToggle()
				end,
				mode = { "n", "t" },
				desc = "Lazygit",
			},
		},
		config = function(_, opts)
			require("toggleterm").setup(opts)
			local Terminal = require("toggleterm.terminal").Terminal

			local float = Terminal:new({
				direction = "float",
				hidden = true,
			})

			local lazygit = Terminal:new({
				direction = "float",
        cmd = "lazygit",
				float_opts = {
					border = "double",
				},
				hidden = true,
			})

			function FloatToggle()
				float:toggle()
			end

			function LazygitToggle()
				lazygit:toggle()
			end
		end,
	},
}
