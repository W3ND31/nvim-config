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
				"<C-f>",
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
				"<leader>rs",
				function()
					ReplToggle()
				end,
				ft = { "clojure", "toggleterm" },
				mode = { "n" },
				desc = "Repl",
			},
			{
				"<leader>rc",
				function()
					CReplToggle()
				end,
				ft = { "clojure", "toggleterm" },
				mode = { "n" },
				desc = "Catalyst Repl",
			},
			{
				"<C-r>s",
				function()
					ReplToggle()
				end,
				ft = { "clojure", "toggleterm" },
				mode = { "t" },
				desc = "Repl",
			},
			{
				"<C-r>c",
				function()
					CReplToggle()
				end,
				ft = { "clojure", "toggleterm" },
				mode = { "t" },
				desc = "Catalyst Repl",
			},
		},
		config = function(_, opts)
			require("toggleterm").setup(opts)
			local Terminal = require("toggleterm.terminal").Terminal

			local float = Terminal:new({ direction = "float", hidden = true })

			local crepl = Terminal:new({
				direction = "float",
				cmd = "lein catalyst-repl",
				on_open = function(_)
					vim.cmd("stopinsert!")
				end,
				hidden = true,
			})

			local repl = Terminal:new({
				direction = "float",
				cmd = "lein repl",
				on_open = function(_)
					vim.cmd("stopinsert!")
				end,
				hidden = true,
			})

			function FloatToggle()
				float:toggle()
			end

			function ReplToggle()
				repl:toggle()
			end

			function CReplToggle()
				crepl:toggle()
			end
		end,
	},
}
