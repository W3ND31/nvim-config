return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        preset = "modern",
        spec = {
            --groups
            { "<leader>f", group = "Find/Files" },
            { "<leader>b", group = "Buffer" },
            { "<leader>g", group = "Git" },
            { "<leader>c", group = "Code" },
            { "<leader>q", group = "Quit" },
            { "<leader>w", group = "Windows" },
            { "gs",        group = "Surround" },
            { "g",         group = "Goto" },
            { "z",         group = "Fold" },

            -- general mappings
            {
                "<C-s>",
                "<cmd>w<CR><ESC>",
                mode = { "i", "x", "n", "s" },
                desc = "Save"
            },
            {
                "<leader>qq",
                "<cmd>qa<CR>",
                mode = { "n", "i", "v" },
                desc = "Quit"
            },
            { "<C-z>",     "<nop>" },

            -- Lazy
            { "<leader>l", "<cmd>Lazy<CR>", mode = "n", desc = "Lazy" },

            -- Windows
            {
                "<C-h>",
                "<C-w>h",
                mode = { "n", "t" },
                desc = "Go to Left Window",
                remap = true
            },
            {
                "<C-j>",
                "<C-w>j",
                mode = { "n", "t" },
                desc = "Go to Lower Window",
                remap = true
            },
            {
                "<C-k>",
                "<C-w>k",
                mode = { "n", "t" },
                desc = "Go to Upper Window",
                remap = true
            },
            {
                "<C-l>",
                "<C-w>l",
                mode = { "n", "t" },
                desc = "Go to Right Window",
                remap = true
            },

            {
                "<leader>ws",
                "<C-W>s",
                mode = "n",
                desc = "Split Horizontal -",
                remap = true
            },
            {
                "<leader>wv",
                "<C-W>v",
                mode = "n",
                desc = "Split Vertical |",
                remap = true
            },
            {
                "<leader>wq",
                "<C-W>c",
                mode = "n",
                desc = "Quit",
                remap = true
            },

            -- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
            {
                "n",
                "'Nn'[v:searchforward].'zv'",
                mode = "n",
                desc = "Next Search Result",
                expr = true,
            },
            {
                "n",
                "'Nn'[v:searchforward]",
                mode = "x",
                desc = "Next Search Result",
                expr = true,
            },
            {
                "n",
                "'Nn'[v:searchforward]",
                mode = "o",
                desc = "Next Search Result",
                expr = true,
            },
            {
                "N",
                "'nN'[v:searchforward].'zv'",
                mode = "n",
                desc = "Prev Search Result",
                expr = true,
            },
            {
                "N",
                "'nN'[v:searchforward]",
                mode = "x",
                desc = "Prev Search Result",
                expr = true,
            },
            {
                "N",
                "'nN'[v:searchforward]",
                mode = "o",
                desc = "Prev Search Result",
                expr = true,
            },

            -- Move Lines
            {
                "<A-j>",
                "<cmd>execute 'move .+' . v:count1<cr>==",
                mode = "n",
                desc = "Move Down"
            },
            {
                "<A-k>",
                "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==",
                mode = "n",
                desc = "Move Up"
            },
            {
                "<A-j>",
                "<esc><cmd>m .+1<cr>==gi",
                mode = "i",
                desc = "Move Down"
            },
            {
                "<A-k>",
                "<esc><cmd>m .-2<cr>==gi",
                mode = "i",
                desc = "Move Up"
            },
            {
                "<A-j>",
                ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv",
                mode = "v",
                desc = "Move Down"
            },
            {
                "<A-k>",
                ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv",
                mode = "v",
                desc = "Move Up"
            },

            -- better up/down
            {
                "j",
                "v:count == 0 ? 'gj' : 'j'",
                mode = { "n", "x" },
                desc = "Down",
                expr = true,
                silent = true
            },
            {
                "<Down>",
                "v:count == 0 ? 'gj' : 'j'",
                mode = { "n", "x" },
                desc = "Down",
                expr = true,
                silent = true
            },
            {
                "k",
                "v:count == 0 ? 'gk' : 'k'",
                mode = { "n", "x" },
                desc = "Up",
                expr = true,
                silent = true
            },
            {
                "<Up>",
                "v:count == 0 ? 'gk' : 'k'",
                mode = { "n", "x" },
                desc = "Up",
                expr = true,
                silent = true
            },

            -- Clear search and stop snippet on escape
            {
                "<esc>",
                function()
                    vim.cmd("noh")
                    if vim.snippet then
                        vim.snippet.stop()
                    end
                    return "<esc>"
                end,
                mode = { "i", "n", "s" },
                expr = true,
                desc = "Escape and Clear hlsearch"
            },

            { "<C-q>", "<cmd> bd <CR>", mode = "n", desc = "Quit Tab" }, }
    },
    dependencies = {
        { "echasnovski/mini.icons" }
    }
}
