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
      projects = {
        "~/dev/nu/*",
        "~/.config/*",
      },
      picker = {
        type = "telescope",
      },
    },
    init = function()
      vim.opt.sessionoptions:append("globals")
    end,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim", tag = "0.1.4" },
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
  {
    "folke/which-key.nvim",
    opts = {
      preset = "modern",
      win = {
        no_overlap = false,
      },
    },
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      open_mapping = [[<c-t>]],
      on_open = function(_term)
        vim.cmd("startinsert!")
      end,
      on_close = function(_term)
        vim.cmd("startinsert!")
      end,
      size = 25,
      direction = "horizontal",
      float_opts = {
        border = "curved",
        winblend = 6,
      },
    },
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
  },
}
