return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make'
    },
    'nvim-telescope/telescope-ui-select.nvim'
  },
  opts = {
    defaults = {
      sorting_strategy = "ascending",
      layout_config = {
        horizontal = { prompt_position = "bottom" },
      },
    },
    extensions = {
      fzf = { fuzzy = true, override_generic_sorter = true, override_file_sorter = true, case_mode = 'smart_case' },
      ['ui-select'] = { require 'telescope.themes'.get_dropdown() }
    },
    vimgrep_argument = { 'rg', '--smart-case' }
  },
  keys = {
    -- { '<C-q>',      function() require 'telescope.builtin'.quickfix() end },
    { "<leader> ",  "<cmd> Telescope find_files <CR>",   mode = { "n" }, desc = "Find Files" },
    { "<leader>fo", "<cmd> Telescope oldfiles <CR>",     mode = { "n" }, desc = "Old Files" },
    { "<leader>fw", "<cmd> Telescope live_grep <CR>",    mode = { "n" }, desc = "Find in Project" },
    { "<leader>gs", "<cmd> Telescope git_status <CR>",   mode = { "n" }, desc = "Status" },
    { "gr",         "<cmd>Telescope lsp_references<cr>", mode = { "n" }, desc = "References", },
    {
      "gd",
      function()
        require("telescope.builtin").lsp_definitions({ reuse_win = true })
      end,
      desc = "Goto Definition"
    },
    {
      "gI",
      function()
        require("telescope.builtin").lsp_implementations({ reuse_win = true })
      end,
      desc = "Goto Implementation"
    },
    {
      "gy",
      function()
        require("telescope.builtin").lsp_type_definitions({ reuse_win = true })
      end,
      desc = "Goto T[y]pe Definition"
    },
  }
}
