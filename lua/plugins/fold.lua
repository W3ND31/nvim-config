return {
	{
		"kevinhwang91/nvim-ufo",
		version = "*",
		opts = {
			provider_selector = function(bufnr, filetype, buftype)
				return { "treesitter", "indent" }
			end,
		},
		dependencies = {
			{
				"kevinhwang91/promise-async",
				version = "*",
			},
		},
	},
}
