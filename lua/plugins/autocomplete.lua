return {
	{
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
	},
}
