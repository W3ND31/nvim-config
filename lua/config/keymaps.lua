local map = vim.keymap.set
map("n", "\\", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "|", "<C-W>v", { desc = "Split Window Right", remap = true })
map("n", "<localleader>rs", "<cmd>Lein<CR>", { desc = "REPL Start" })
map("n", "<leader>p", "<cmd>NeovimProjectDiscover<CR>", { desc = "Find project" })
map("n", "<leader>gG", function()
  LazyVim.lazygit({ cwd = LazyVim.root.git() })
end, { desc = "Lazygit (Root Dir)" })
map("n", "<leader>gg", function()
  LazyVim.lazygit()
end, { desc = "Lazygit (cwd)" })
