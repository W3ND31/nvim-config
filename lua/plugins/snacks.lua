local function term_nav(dir)
	return function(self)
		return self:is_floating() and "<c-" .. dir .. ">" or vim.schedule(function()
			vim.cmd.wincmd(dir)
		end)
	end
end

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		lazygit = { enabled = true },
		toggle = {
			map = vim.keymap.set, -- keymap.set function to use
			which_key = true, -- integrate with which-key to show enabled/disabled icons and colors
			notify = true,
			-- icons for enabled/disabled states
			icon = {
				enabled = " ",
				disabled = " ",
			},
			-- colors for enabled/disabled states
			color = {
				enabled = "green",
				disabled = "yellow",
			},
			wk_desc = {
				enabled = "Disable ",
				disabled = "Enable ",
			},
		},
		terminal = {
			enabled = true,
			win = {
				keys = {
					nav_h = { "<C-h>", term_nav("h"), desc = "Go to Left Window", expr = true, mode = "t" },
					nav_j = { "<C-j>", term_nav("j"), desc = "Go to Lower Window", expr = true, mode = "t" },
					nav_k = { "<C-k>", term_nav("k"), desc = "Go to Upper Window", expr = true, mode = "t" },
					nav_l = { "<C-l>", term_nav("l"), desc = "Go to Right Window", expr = true, mode = "t" },
				},
			},
		},
	},
	keys = {
		{
			"<c-/>",
			function()
				Snacks.terminal()
			end,
			mode = { "n", "t" },
			desc = "Terminal (cwd)",
		},
		{
			"<leader>gg",
			function()
				Snacks.lazygit.open()
			end,
			desc = "Lazygit",
		},
	},
	config = function()
		Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
		Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
		Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
		Snacks.toggle.line_number():map("<leader>ul")
		Snacks.toggle
			.option(
				"conceallevel",
				{ off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2, name = "Conceal Level" }
			)
			:map("<leader>uc")
		Snacks.toggle.treesitter():map("<leader>uT")
		Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
		Snacks.toggle.dim():map("<leader>uD")
		Snacks.toggle.animate():map("<leader>ua")
		Snacks.toggle.scroll():map("<leader>uS")
		Snacks.toggle({
			name = "Illuminate",
			get = function()
				return not require("illuminate.engine").is_paused()
			end,
			set = function(enabled)
				local m = require("illuminate")
				if enabled then
					m.resume()
				else
					m.pause()
				end
			end,
		}):map("<leader>ui")
	end,
}
