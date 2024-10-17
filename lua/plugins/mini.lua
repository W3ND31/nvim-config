return {
  {
    "echasnovski/mini.pairs",
    opts = {
      skip_unbalanced = false,
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
  { import = "lazyvim.plugins.extras.coding.mini-comment" },
  {
    "echasnovski/mini.comment",
    opts = {
      mappings = {
        comment = "<LEADER>/",
        comment_line = "<LEADER>/",
        comment_visual = "<LEADER>/",
        textobject = "<LEADER>/",
      },
    },
  },
}
