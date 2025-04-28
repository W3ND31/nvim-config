return {
	{
		"m00qek/baleia.nvim",
		opts = {
			line_starts_at = 3,
		},
		config = function(_, opts)
			vim.g.conjure_baleia = require("baleia").setup(opts)

			vim.api.nvim_create_user_command("BaleiaColorize", function()
				vim.g.conjure_baleia.once(vim.api.nvim_get_current_buf())
			end, { bang = true })

			vim.api.nvim_create_user_command("BaleiaLogs", vim.g.conjure_baleia.logger.show, { bang = true })
		end,
	},
	{
		"Olical/conjure",
		ft = { "clojure", "fennel", "python" }, -- etc
		lazy = true,
		init = function()
			-- Set configuration options here
			-- Uncomment this to get verbose logging to help diagnose internal Conjure issues
			-- This is VERY helpful when reporting an issue with the project
			-- vim.g["conjure#debug"] = true
			-- print color codes if baleia.nvim is available

			vim.g["conjure#log#strip_ansi_escape_sequences_line_limit"] = 0

			-- disable diagnostics in log buffer and colorize it
			vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
				pattern = "conjure-log-*",
				callback = function()
					local buffer = vim.api.nvim_get_current_buf()
					vim.diagnostic.enable(false, { bufnr = buffer })

					if vim.g.conjure_baleia then
						vim.g.conjure_baleia.automatically(buffer)
					end

					vim.keymap.set(
						{ "n", "v" },
						"[c",
						"<CMD>call search('^; -\\+$', 'bw')<CR>",
						{ silent = true, buffer = true, desc = "Jumps to the begining of previous evaluation output." }
					)
					vim.keymap.set(
						{ "n", "v" },
						"]c",
						"<CMD>call search('^; -\\+$', 'w')<CR>",
						{ silent = true, buffer = true, desc = "Jumps to the begining of next evaluation output." }
					)
				end,
			})

			vim.g["conjure#mapping#doc_word"] = "K"
			vim.g["conjure#mapping#def_word"] = "gd"
		end,
	},
}
