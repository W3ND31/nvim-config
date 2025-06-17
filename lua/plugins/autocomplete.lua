return {
	{
		"saghen/blink.compat",
		version = "*",
		lazy = true,
	},
	{
		"saghen/blink.cmp",
		version = "1.3.1",
		dependencies = {
			"rafamadriz/friendly-snippets",
			"PaterJason/cmp-conjure",
			"L3MON4D3/LuaSnip",
		},
		opts = {
			keymap = { preset = "super-tab" },
			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "MesloLGS NF",
			},
			completion = {
				ghost_text = { enabled = true },
				menu = {
					draw = {
						columns = { { "kind_icon" }, { "label", "label_description", gap = 1 }, { "source_name" } },
					},
				},
				documentation = { auto_show = true },
			},
			snippets = { preset = "luasnip" },
			sources = {
				default = { "lsp", "path", "snippets", "buffer", "conjure", "lazydev" },
				providers = {
					lsp = {
						name = "lsp",
						enabled = true,
						module = "blink.cmp.sources.lsp",
						kind = "LSP",
					},
					conjure = {
						name = "conjure",
						module = "blink.compat.source",
					},
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						-- make lazydev completions top priority (see `:h blink.cmp`)
					},
				},
			},

			signature = { enabled = true },
			fuzzy = {
				implementation = "lua",
				sorts = {
					function(a, b)
						if (a.client_name == nil or b.client_name == nil) or (a.client_name == b.client_name) then
							return
						end
						return b.client_name == "clojure_lsp"
					end,
					-- default sorts
					"score",
					"sort_text",
				},
			},
		},
		lazy = false,
	},
}
