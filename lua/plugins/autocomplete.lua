return {
	{
		"saghen/blink.compat",
		-- use v2.* for blink.cmp v1.*
		version = "2.*",
		-- lazy.nvim will automatically load the plugin when it's required by blink.cmp
		lazy = true,
		-- make sure to set opts so that lazy.nvim calls blink.compat's setup
		opts = {},
	},
	{
		"saghen/blink.cmp",
		dependencies = {
			"rafamadriz/friendly-snippets",
			"fang2hou/blink-copilot",
			"PaterJason/cmp-conjure",
		},
		version = "1.*",
		opts = {
			keymap = {
				preset = "super-tab",
			},
			appearance = {
				nerd_font_variant = "mono",
				kind_icons = {
					Copilot = "",
					Text = "󰉿",
					Method = "󰊕",
					Function = "󰊕",
					Constructor = "󰒓",

					Field = "󰜢",
					Variable = "󰆦",
					Property = "󰖷",

					Class = "󱡠",
					Interface = "󱡠",
					Struct = "󱡠",
					Module = "󰅩",

					Unit = "󰪚",
					Value = "󰦨",
					Enum = "󰦨",
					EnumMember = "󰦨",

					Keyword = "󰻾",
					Constant = "󰏿",

					Snippet = "󱄽",
					Color = "󰏘",
					File = "󰈔",
					Reference = "󰬲",
					Folder = "󰉋",
					Event = "󱐋",
					Operator = "󰪚",
					TypeParameter = "󰬛",
				},
			},
			completion = {
				menu = {
					border = "single",
				},
				documentation = {
					auto_show = true,
					window = { border = "single" },
				},
			},
			sources = {
				default = {
					"conjure",
					"lsp",
					"copilot",
					"path",
					"snippets",
					"buffer",
				},
				providers = {
					copilot = {
						name = "copilot",
						module = "blink-copilot",
						score_offset = 100,
						async = true,
					},
					conjure = {
						name = "conjure",
						module = "blink.compat.source",
						score_offset = 0,
					},
				},
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
	--[[ {
		"hrsh7th/nvim-cmp",
		version = "*",
		event = "InsertEnter",
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				version = "*",
				build = (function()
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
			},
			"saadparwaiz1/cmp_luasnip",
			{
				"zbirenbaum/copilot-cmp",
				config = function()
					require("copilot_cmp").setup()
				end,
			},
			"PaterJason/cmp-conjure",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			luasnip.config.setup({})

			cmp.event:on("menu_opened", function()
				vim.b.copilot_suggestion_hidden = true
			end)

			cmp.event:on("menu_closed", function()
				vim.b.copilot_suggestion_hidden = false
			end)

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				completion = { completeopt = "menu,menuone,noinsert" },
				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<Tab>"] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete({}),
					["<C-l>"] = cmp.mapping(function()
						if luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						end
					end, { "i", "s" }),
					["<C-h>"] = cmp.mapping(function()
						if luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						end
					end, { "i", "s" }),
				}),
				sources = {
					{ name = "conjure" },
					-- Copilot Source
					{ name = "copilot", group_index = 2 },
					-- Other Sources
					{ name = "nvim_lsp", group_index = 2 },
					{ name = "path", group_index = 2 },
					{ name = "luasnip", group_index = 2 },
					{ name = "buffer" },
				},
			})
		end,
	} ]]
}
