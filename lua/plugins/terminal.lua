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
			{
				"<localleader>sr",
				function()
					ReplToggle()
				end,
				ft = { "clojure" },
				mode = { "n", "t" },
				desc = "Start Repl",
			},
		},
		config = function(_, opts)
			require("toggleterm").setup(opts)
			local Terminal = require("toggleterm.terminal").Terminal

			local float = Terminal:new({ direction = "float", hidden = true })

			local repl = Terminal:new({
				direction = "float",
				on_open = function(_)
					vim.cmd("stopinsert!")
				end,
				cmd = "lein repl",
				hidden = true,
			})

			local lazygit = Terminal:new({
				direction = "float",
				clear_env = false,
				on_open = function(term)
					vim.cmd("startinsert!")
					vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<esc>", "<esc>", { noremap = true, silent = true })
				end,
				float_opts = { border = "double" },
				hidden = true,
			})

			function FloatToggle()
				float:toggle()
			end

			function LazygitToggle()
				lazygit:toggle()
			end

			function ReplToggle()
				repl:toggle()
			end
		end,
	},
}
