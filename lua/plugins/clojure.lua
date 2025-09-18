return {
	{
		"m00qek/baleia.nvim",
		version = "*",
		lazy = false,
		opts = {},
		config = function(opts)
			vim.g.conjure_baleia = require("baleia").setup(opts)

			vim.api.nvim_create_augroup("ConjureBaleia", { clear = true })

			vim.api.nvim_create_user_command("BaleiaColorize", function()
				vim.g.conjure_baleia.once(vim.api.nvim_get_current_buf())
			end, { bang = true })

			vim.api.nvim_create_user_command("BaleiaLogs", vim.g.conjure_baleia.logger.show, { bang = true })
		end,
	},
	{
		"Olical/conjure",
		lazy = true,
		version = "*",
		config = function()
			require("conjure.main").main()
			require("conjure.mapping")["on-filetype"]()
		end,
		init = function()
			vim.g["conjure#mapping#doc_word"] = "K"
			vim.g["conjure#client#clojure#nrepl#eval#auto_require"] = false
			vim.g["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = false

			-- Print color codes if baleia.nvim is available
			vim.g["conjure#log#strip_ansi_escape_sequences_line_limit"] = 0
			vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
				pattern = "conjure-log-*",
				callback = function()
					vim.diagnostic.enable(false, { bufnr = vim.api.nvim_get_current_buf() })
					vim.g.conjure_baleia.automatically(vim.api.nvim_get_current_buf())
				end,
			})
		end,
		dependencies = {
			{
				"clojure-vim/vim-jack-in",
				lazy = true,
				dependencies = {
					{
						"radenling/vim-dispatch-neovim",
						dependencies = {
							"tpope/vim-dispatch",
						},
					},
				},
				config = function() end,
			},
			-- {
			-- 	"PaterJason/cmp-conjure",
			-- },
		},
	},
	-- {
	-- 	"PaterJason/cmp-conjure",
	-- 	config = function()
	-- 		local cmp = require("cmp")
	-- 		local config = cmp.get_config()
	-- 		table.insert(config.sources, { name = "conjure" })
	-- 		return cmp.setup(config)
	-- 	end,
	-- },
	{
		"julienvincent/nvim-paredit",
		config = function(opts)
			require("nvim-paredit").setup(opts)
		end,
	},
}
