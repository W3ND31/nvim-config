return {
	{
		"gregorias/toggle.nvim",
		version = "*",
		opts = {
			keymaps = {
				toggle_option_prefix = "<leader>t",
			},
		},
		-- config = function(_, opts)
		-- 	require("toggle").setup(opts)
		--
		-- 	local toggle = require("toggle")
		-- 	toggle.register(
		-- 		"B",
		-- 		toggle.option.OnOffOption({
		-- 			name = "Git Blame",
		-- 			get_state = function()
		-- 				return vim.g.gitblame_enabled
		-- 			end,
		-- 			set_state = function(_)
		-- 				vim.cmd("GitBlameToggle")
		-- 			end,
		-- 		})
		-- 	)
		-- end,
	},
}
