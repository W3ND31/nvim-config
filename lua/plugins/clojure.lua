return {
  {
    "Olical/conjure",
    ft = { "clojure", "fennel", "python" }, -- etc
    lazy = true,
    version = "*",
    init = function()
      vim.g["conjure#mapping#doc_word"] = "K"
      vim.g["conjure#mapping#def_word"] = "gd"
    end,
    dependencies = {
      {
        "clojure-vim/vim-jack-in",
        dependencies = {
          {
            "radenling/vim-dispatch-neovim",
            dependencies = {
              "tpope/vim-dispatch",
            }
          }
        },
        config = function()
        --
        end
      },
      {
        "PaterJason/cmp-conjure",
        lazy = true,
        config = function()
          local cmp = require("cmp")
          local config = cmp.get_config()
          table.insert(config.sources, { name = "conjure" })
          return cmp.setup(config)
        end,
      },
    }
  },
  {
    "julienvincent/nvim-paredit",
    opts = {},
    config = function(_, opts)
      local paredit = require("nvim-paredit")

      opts.keys = {
        ["<localleader>@"] = { paredit.unwrap.unwrap_form_under_cursor, "Splice sexp" },
        [">)"] = { paredit.api.slurp_forwards, "Slurp forwards" },
        [">("] = { paredit.api.barf_backwards, "Barf backwards" },

        ["<)"] = { paredit.api.barf_forwards, "Barf forwards" },
        ["<("] = { paredit.api.slurp_backwards, "Slurp backwards" },

        [">e"] = { paredit.api.drag_element_forwards, "Drag element right" },
        ["<e"] = { paredit.api.drag_element_backwards, "Drag element left" },

        [">p"] = { paredit.api.drag_pair_forwards, "Drag element pairs right" },
        ["<p"] = { paredit.api.drag_pair_backwards, "Drag element pairs left" },

        [">f"] = { paredit.api.drag_form_forwards, "Drag form right" },
        ["<f"] = { paredit.api.drag_form_backwards, "Drag form left" },

        ["<localleader>o"] = { paredit.api.raise_form, "Raise form" },
        ["<localleader>O"] = { paredit.api.raise_element, "Raise element" },

        ["E"] = {
          paredit.api.move_to_next_element_tail,
          "Jump to next element tail",
          -- by default all keybindings are dot repeatable
          repeatable = false,
          mode = { "n", "x", "o", "v" },
        },
        ["W"] = {
          paredit.api.move_to_next_element_head,
          "Jump to next element head",
          repeatable = false,
          mode = { "n", "x", "o", "v" },
        },
        ["B"] = {
          paredit.api.move_to_prev_element_head,
          "Jump to previous element head",
          repeatable = false,
          mode = { "n", "x", "o", "v" },
        },
        ["gE"] = {
          paredit.api.move_to_prev_element_tail,
          "Jump to previous element tail",
          repeatable = false,
          mode = { "n", "x", "o", "v" },
        },
        ["("] = {
          paredit.api.move_to_parent_form_start,
          "Jump to parent form's head",
          repeatable = false,
          mode = { "n", "x", "v" },
        },
        [")"] = {
          paredit.api.move_to_parent_form_end,
          "Jump to parent form's tail",
          repeatable = false,
          mode = { "n", "x", "v" },
        },
        -- These are text object selection keybindings which can used with standard `d, y, c`, `v`
        ["af"] = {
          paredit.api.select_around_form,
          "Around form",
          repeatable = false,
          mode = { "o", "v" },
        },
        ["if"] = {
          paredit.api.select_in_form,
          "In form",
          repeatable = false,
          mode = { "o", "v" },
        },
        ["aF"] = {
          paredit.api.select_around_top_level_form,
          "Around top level form",
          repeatable = false,
          mode = { "o", "v" },
        },
        ["iF"] = {
          paredit.api.select_in_top_level_form,
          "In top level form",
          repeatable = false,
          mode = { "o", "v" },
        },
        ["ae"] = {
          paredit.api.select_element,
          "Around element",
          repeatable = false,
          mode = { "o", "v" },
        },
        ["ie"] = {
          paredit.api.select_element,
          "Element",
          repeatable = false,
          mode = { "o", "v" },
        },
      }
      paredit.setup(opts)
    end,
  },
}
