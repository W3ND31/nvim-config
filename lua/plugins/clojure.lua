return {
	{
		"tpope/vim-dispatch",
	},
	{
		"clojure-vim/vim-jack-in",
		dependencies = { "radenling/vim-dispatch-neovim" },
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = { ensure_installed = { "clojure" } },
	},

	-- Extend auto completion
	{
		"hrsh7th/nvim-cmp",
		optional = true,
		dependencies = {
			"PaterJason/cmp-conjure",
		},
		opts = function(_, opts)
			if type(opts.sources) == "table" then
				vim.list_extend(opts.sources, { name = "clojure" })
			end
		end,
	},

	-- Add s-exp mappings
	{ "PaterJason/nvim-treesitter-sexp", opts = {}, event = "LazyFile" },
	{
		"m00qek/baleia.nvim",
		--   version = "*",
		--   config = function()
		--     vim.g.conjure_baleia = require("baleia").setup({ line_starts_at = 3 })

		--     local augroup = vim.api.nvim_create_augroup("ConjureBaleia", { clear = true })

		--     vim.api.nvim_create_user_command("BaleiaColorize", function()
		--       vim.g.conjure_baleia.once(vim.api.nvim_get_current_buf())
		--     end, { bang = true })

		--     vim.api.nvim_create_user_command("BaleiaLogs", vim.g.conjure_baleia.logger.show, { bang = true })
		--   end,
		-- Lazyvim config below
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
		event = "LazyFile",
		ft = { "clojure", "fennel" },
		config = function()
			require("conjure.main").main()
			require("conjure.mapping")["on-filetype"]()
		end,
		-- init = function()
		--     -- Print color codes if baleia.nvim is available
		--     local colorize = require("lazyvim.util").has("baleia.nvim")
		--     vim.g["conjure#log#strip_ansi_escape_sequences_line_limit"] = colorize and 1 or nil

		--     -- Disable diagnostics in log buffer and colorize it
		--     vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
		--         pattern = "conjure-log-*",
		--         callback = function()
		--             local buffer = vim.api.nvim_get_current_buf()
		--             vim.diagnostic.enable(false, { bufnr = buffer })
		--             if colorize and vim.g.conjure_baleia then
		--                 vim.g.conjure_baleia.automatically(buffer)
		--             end
		--         end,
		--     })
		-- end,
		--LazyVim config below
		init = function()
			-- print color codes if baleia.nvim is available
			vim.g["conjure#log#strip_ansi_escape_sequences_line_limit"] = 0

			-- disable diagnostics in log buffer and colorize it
			vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
				pattern = "conjure-log-*",
				callback = function()
					local buffer = vim.api.nvim_get_current_buf()
					vim.diagnostic.enable(false, { bufnr = buffer })

					if colorize and vim.g.conjure_baleia then
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
		end,
	},
}
