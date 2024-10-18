---@param name string
---@param bg? boolean
---@return string?
local function color(name, bg)
	---@type {foreground?:number}?
	---@diagnostic disable-next-line: deprecated
	local hl = vim.api.nvim_get_hl and vim.api.nvim_get_hl(0, { name = name, link = false })
		or vim.api.nvim_get_hl_by_name(name, true)
	---@diagnostic disable-next-line: undefined-field
	---@type string?
	local color = nil
	if hl then
		if bg then
			color = hl.bg or hl.background
		else
			color = hl.fg or hl.foreground
		end
	end
	return color and string.format("#%06x", color) or nil
end

---@return {fg?:string}?
local function fg(name)
	local color = color(name)
	return color and { fg = color } or nil
end

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = function()
		local icons = require("config.icons")
		local opts = {
			options = {
				icons_enabled = true,
				theme = "auto",
				globalstatus = vim.o.laststatus == 3,
				disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter" } },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = {
					"encoding",
					"fileformat",
					"filetype",
					{
						function()
							return require("noice").api.status.command.get()
						end,
						cond = function()
							return package.loaded["noice"] and require("noice").api.status.command.has()
						end,
						color = function()
							return fg("Statement")
						end,
					},
					{
						function()
							return require("noice").api.status.mode.get()
						end,
						cond = function()
							return package.loaded["noice"] and require("noice").api.status.mode.has()
						end,
						color = function()
							return fg("Constant")
						end,
					},
					{
						function()
							return "  " .. require("dap").status()
						end,
						cond = function()
							return package.loaded["dap"] and require("dap").status() ~= ""
						end,
						color = function()
							return fg("Debug")
						end,
					},
					{
						"diff",
						symbols = {
							added = icons.git.added,
							modified = icons.git.modified,
							removed = icons.git.removed,
						},
						source = function()
							local gitsigns = vim.b.gitsigns_status_dict
							if gitsigns then
								return {
									added = gitsigns.added,
									modified = gitsigns.changed,
									removed = gitsigns.removed,
								}
							end
						end,
					},
				},
				lualine_y = {
					{ "progress", separator = " ", padding = { left = 1, right = 0 } },
					{ "location", padding = { left = 0, right = 1 } },
				},
				lualine_z = {
					function()
						return " " .. os.date("%R")
					end,
				},
			},
			extensions = { "neo-tree", "lazy" },
		}
		return opts
	end,
}
