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
				"<C-g>",
				function()
					LazygitToggle()
				end,
				mode = { "n", "t" },
				desc = "Lazygit",
			},
			{
				"<leader>gg",
				function()
					LazygitToggle()
				end,
				mode = { "n" },
				desc = "Lazygit",
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
				on_open = function(_)
					vim.cmd("stopinsert!")
				end,
				cmd = "lein catalyst-repl",
				hidden = true,
			})

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

			function CReplToggle()
				crepl:toggle()
			end
		end,
	},
}
