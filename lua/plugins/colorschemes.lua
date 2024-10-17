return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "fluoromachine",
    },
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
  },
  {
    "rebelot/kanagawa.nvim",
  },
  {
    "sainnhe/edge",
  },
  {
    "lunarvim/synthwave84.nvim",
    opts = {
      glow = {
        error_msg = true,
        type2 = true,
        func = true,
        keyword = true,
        operator = false,
        buffer_current_target = true,
        buffer_visible_target = true,
        buffer_inactive_target = true,
      },
    },
  },
  {
    "maxmx03/fluoromachine.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      glow = true,
      theme = "fluoromachine",
      transparent = false,
    },
  },
  {
    "samharju/synthweave.nvim",
    opts = {
      transparent = false,
    },
  },
}
