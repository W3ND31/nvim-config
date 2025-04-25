return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        spec = {
            -- groups
            { "<leader>f",  group = "File" },

            { "<leader>q",  group = "Quit" },
            { "<leader>qq", "<cmd>q<cr>",    desc = "Quit" },

            { "<leader>l",  "<cmd>Lazy<cr>", desc = "Lazy" },
            { "<c-s>",      "<cmd>w<cr>",    desc = "Save" },

            { "<leader>w",  proxy = "<c-w>", group = "windows" }, -- proxy to window mappings
            {
                "<leader>b",
                group = "buffers",
                expand = function()
                    return require("which-key.extras").expand.buf()
                end
            },
            { '<S-Left>', '<Cmd>BufferPrevious<CR>', desc = "Previous Buffer" }
        }
    },
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
    },
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "echasnovski/mini.icons"
    }
}
