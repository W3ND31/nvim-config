return {
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
}
