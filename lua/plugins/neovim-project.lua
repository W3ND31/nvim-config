return {
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
}
