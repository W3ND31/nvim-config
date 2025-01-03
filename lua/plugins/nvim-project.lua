return {
  "coffebar/neovim-project",
  opts = {
    projects = {
      "~/dev/nu/*",
      "~/.config/*",
    },
    picker = {
      type = "fzf-lua",
    },
    dashboard_mode = true,
  },
  init = function()
    vim.opt.sessionoptions:append("globals")
  end,
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "ibhagwan/fzf-lua" },
    { "Shatur/neovim-session-manager" },
  },
  lazy = false,
  priority = 100,
}
