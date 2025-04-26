return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  opts = {
    defaults = {
      sorting_strategy = "ascending",
      layout_config = {
        horizontal = { prompt_position = "bottom" },
      },
    },
  },
  keys = {
    { "<leader> ",  "<cmd> Telescope find_files <CR>", mode = { "n" }, desc = "Find Files" },
    { "<leader>fo", "<cmd> Telescope oldfiles <CR>",   mode = { "n" }, desc = "Old Files" },
    { "<leader>fw", "<cmd> Telescope live_grep <CR>",  mode = { "n" }, desc = "Find in Project" },
    { "<leader>gs", "<cmd> Telescope git_status <CR>", mode = { "n" }, desc = "Status" },
  }
}
