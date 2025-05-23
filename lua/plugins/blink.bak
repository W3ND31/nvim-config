return {
	{
		"saghen/blink.compat",
		lazy = true,
		opts = {
			debug = false,
		},
	},
	{
		"saghen/blink.cmp",
		dependencies = {
			"rafamadriz/friendly-snippets",
			"PaterJason/cmp-conjure",
		},
		opts = {
			-- All presets have the following mappings:
			-- C-space: Open menu or open docs if already open
			-- C-n/C-p or Up/Down: Select next/previous item
			-- C-e: Hide menu
			-- C-k: Toggle signature help (if signature.enabled = true)
			--
			-- See :h blink-cmp-config-keymap for defining your own keymap
			keymap = { preset = "super-tab" },

			appearance = {
				nerd_font_variant = "MesloLGS NF",
			},

			completion = {
				documentation = {
					auto_show = true,
				},
			},

			sources = {
				default = {
					"lsp",
					"path",
					"snippets",
					"buffer",
					"conjure",
				},
				providers = {
					lsp = {
						name = "lsp",
						enabled = true,
						module = "blink.cmp.sources.lsp",
						kind = "LSP",
						score_offset = 1000,
					},
					conjure = {
						name = "conjure",
						enable = true,
						module = "blink.compat.source",
						score_offset = 1001,
						opts = {},
					},
				},
			},
			signature = { enabled = true },

			fuzzy = { implementation = "lua" },
		},
		-- config = function(_, opts)
		-- 	local lspconfig = require("lspconfig")
		-- 	for server, config in pairs(opts.servers) do
		-- 		config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
		-- 		lspconfig[server].setup(config)
		-- 	end
		-- end,
		opts_extend = { "sources.default" },
	},
}
