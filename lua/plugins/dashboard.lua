local art = [[


+===============================================================================+
|                                                                               |
|                                                                               |
|      __      __          ___                                      __          |
|     /\ \  __/\ \        /\_ \                                    /\ \         |
|     \ \ \/\ \ \ \     __\//\ \     ___    ___     ___ ___      __\ \ \        |
|      \ \ \ \ \ \ \  /'__`\\ \ \   /'___\ / __`\ /' __` __`\  /'__`\ \ \       |
|       \ \ \_/ \_\ \/\  __/ \_\ \_/\ \__//\ \L\ \/\ \/\ \/\ \/\  __/\ \_\      |
|        \ `\___x___/\ \____\/\____\ \____\ \____/\ \_\ \_\ \_\ \____\\/\_\     |
|         '\/__//__/  \/____/\/____/\/____/\/___/  \/_/\/_/\/_/\/____/ \/_/     |
|                                                                               |
|                                                                               |
+===============================================================================+


]]

-- generated at https://www.asciiart.eu/text-to-ascii-art

return {
	"goolord/alpha-nvim",
	enabled = true,
	version = "*",
	event = "VimEnter",
	lazy = true,
	opts = function()
		local logo = art
		local dashboard = require("alpha.themes.dashboard")
		dashboard.section.header.val = vim.split(logo, "\n")
		dashboard.section.buttons.val = {
			dashboard.button("p", " " .. " Projects", "<cmd>NeovimProjectDiscover<CR>"),
			dashboard.button("n", " " .. " Nvim", "<cmd>NeovimProjectLoad ~/.config/nvim<CR>"),
			dashboard.button("m", "󱌢" .. "  Mason", "<cmd>Mason<CR>"),
			dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
			dashboard.button("q", " " .. " Quit", ":qa<CR>"),
		}
		for _, button in ipairs(dashboard.section.buttons.val) do
			button.opts.hl = "AlphaButtons"
			button.opts.hl_shortcut = "AlphaShortcut"
		end
		dashboard.section.header.opts.hl = "AlphaHeader"
		dashboard.section.buttons.opts.hl = "AlphaButtons"
		dashboard.section.footer.opts.hl = "AlphaFooter"
		dashboard.opts.layout[1].val = 8
		return dashboard
	end,
	config = function(_, dashboard)
		-- close Lazy and re-open when the dashboard is ready
		if vim.o.filetype == "lazy" then
			vim.cmd.close()
			vim.api.nvim_create_autocmd("User", {
				pattern = "AlphaReady",
				callback = function()
					require("lazy").show()
				end,
			})
		end

		require("alpha").setup(dashboard.opts)

		vim.api.nvim_create_autocmd("User", {
			pattern = "LazyVimStarted",
			callback = function()
				local stats = require("lazy").stats()
				local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
				dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
				pcall(vim.cmd.AlphaRedraw)
			end,
		})
	end,
}
