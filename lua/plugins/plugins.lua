vim.g["conjure#client#clojure#nrepl#test#current_form_names"] =
  { "deftest", "defflow", "defspec", "defflow-i18n", "defflow-mx", "defflow-co" }
return {
  {
    "tpope/vim-dispatch",
  },
  {
    "clojure-vim/vim-jack-in",
    dependencies = { "radenling/vim-dispatch-neovim" },
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
  },
  {
    "m00qek/baleia.nvim",
  },
  {
    "Olical/conjure",
  },
  {
    "echasnovski/mini.pairs",
    opts = {
      skip_unbalanced = false,
    },
  },
  {
    "coffebar/neovim-project",
    opts = {
      projects = { -- define project roots
        "~/dev/nu/*",
        "~/.config/*",
      },
      picker = {
        type = "telescope", -- or "fzf-lua"
      },
    },
    init = function()
      -- enable saving the state of plugins in the session
      vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
    end,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      -- optional picker
      { "nvim-telescope/telescope.nvim", tag = "0.1.4" },
      -- optional picker
      { "ibhagwan/fzf-lua" },
      { "Shatur/neovim-session-manager" },
    },
    lazy = false,
    priority = 100,
  },
  {
    "gbprod/yanky.nvim",
    keys = {
      { "<leader>p", false },
      {
        "<leader>P",
        function()
          if LazyVim.pick.picker.name == "telescope" then
            require("telescope").extensions.yank_history.yank_history({})
          else
            vim.cmd([[YankyRingHistory]])
          end
        end,
        mode = { "n", "x" },
        desc = "Open Yank History",
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
            cmp.select_next_item()
          elseif vim.snippet.active({ direction = 1 }) then
            vim.schedule(function()
              vim.snippet.jump(1)
            end)
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif vim.snippet.active({ direction = -1 }) then
            vim.schedule(function()
              vim.snippet.jump(-1)
            end)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },
  {
    "echasnovski/mini.surround",
    opts = {
      mappings = {
        add = "gsa",
        delete = "gsd",
        find = "gsf",
        find_left = "gsF",
        highlight = "gsh",
        replace = "gsr",
        update_n_lines = "gsn",
      },
    },
  },
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        always_show_bufferline = true,
        separator_style = "slant",
        indicator = {
          style = "underline",
        },
      },
    },
  },
}