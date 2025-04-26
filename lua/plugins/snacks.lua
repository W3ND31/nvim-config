return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        explorer = { enabled = true },
        input = { enabled = true },
        terminal = { enabled = true },
    },
    keys = {
        { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
        { "<c-/>",     function() Snacks.terminal() end, mode = { "n", "t" },   desc = "Terminal (cwd)" },
    },
}
