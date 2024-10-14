local map = vim.keymap.set
map("n", "\\", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "|", "<C-W>v", { desc = "Split Window Right", remap = true })
map("n", "<localleader>rs", "<cmd>Lein<CR>", { desc = "REPL Start" })
map("n", "<leader>p", "<cmd>NeovimProjectDiscover<CR>", { desc = "Find project" })
map("n", "<leader>gg", "<CMD>lua term.lazygit_toggle()<CR>", { desc = "open lazygit" })
