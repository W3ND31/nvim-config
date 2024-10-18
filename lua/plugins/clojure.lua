vim.g["conjure#client#clojure#nrepl#test#current_form_names"] =
{ "deftest", "defflow", "defspec", "defflow-i18n", "defflow-mx", "defflow-co" }

vim.filetype.add({
	pattern = {
		["${NU_HOME}/.*/resources/.*_config.edn.base"] = "clojure",
		["${NU_HOME}/.*/resources/.*_config.json.base"] = "json",
	},
})

return {
	{
		"tpope/vim-dispatch",
	},
	{
		"clojure-vim/vim-jack-in",
		dependencies = { "radenling/vim-dispatch-neovim" },
	},
	{
		"m00qek/baleia.nvim",
		version = "*",
		config = function()
			vim.g.conjure_baleia = require("baleia").setup({ line_starts_at = 3 })

			local augroup = vim.api.nvim_create_augroup("ConjureBaleia", { clear = true })

			vim.api.nvim_create_user_command("BaleiaColorize", function()
				vim.g.conjure_baleia.once(vim.api.nvim_get_current_buf())
			end, { bang = true })

			vim.api.nvim_create_user_command("BaleiaLogs", vim.g.conjure_baleia.logger.show, { bang = true })
		end,
	},
	{
		"Olical/conjure",
		ft = { "clojure", "fennel" },
		config = function()
			require("conjure.main").main()
			require("conjure.mapping")["on-filetype"]()
		end,
		init = function()
			-- Print color codes if baleia.nvim is available

			vim.g["conjure#log#strip_ansi_escape_sequences_line_limit"] = 0

			-- Disable diagnostics in log buffer and colorize it
			vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
				pattern = "conjure-log-*",
				callback = function()
					local buffer = vim.api.nvim_get_current_buf()
					vim.diagnostic.enable(false, { bufnr = buffer })
					if vim.g.conjure_baleia then
						vim.g.conjure_baleia.automatically(buffer)
					end
				end,
			})
		end,
	},
}
