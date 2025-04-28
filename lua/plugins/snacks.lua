local function term_nav(dir)
    return function(self)
        return self:is_floating() and "<c-" .. dir .. ">" or vim.schedule(function()
            vim.cmd.wincmd(dir)
        end)
    end
end

return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        explorer = { enabled = true },
        input = { enabled = true },
        terminal = {
            enabled = true,
            win = {
                keys = {
                    nav_h = { "<C-h>", term_nav("h"), desc = "Go to Left Window", expr = true, mode = "t" },
                    nav_j = { "<C-j>", term_nav("j"), desc = "Go to Lower Window", expr = true, mode = "t" },
                    nav_k = { "<C-k>", term_nav("k"), desc = "Go to Upper Window", expr = true, mode = "t" },
                    nav_l = { "<C-l>", term_nav("l"), desc = "Go to Right Window", expr = true, mode = "t" },
                },
            },
        },
    },
    keys = {
        {
            "<leader>e",
            function() Snacks.explorer() end,
            desc = "File Explorer"
        },
        {
            "<c-/>",
            function() Snacks.terminal() end,
            mode = { "n", "t" },
            desc = "Terminal (cwd)"
        },
    },
}
