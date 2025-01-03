return {
  {
    "tpope/vim-dispatch",
  },
  {
    "clojure-vim/vim-jack-in",
    dependencies = {
      "radenling/vim-dispatch-neovim",
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "clojure" },
    },
  },
  {
    "hrsh7th/nvim-cmp",
  },
  {
    "PaterJason/nvim-treesitter-sexp",
    opts = {},
    event = "LazyFile",
  },
  {
    "m00qek/baleia.nvim",
  },
  {
    "Olical/conjure",
  },
}
