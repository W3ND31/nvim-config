local map = vim.keymap.set
map("n", "\\", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "|", "<C-W>v", { desc = "Split Window Right", remap = true })
map("n", "<leader>p", "<cmd>NeovimProjectDiscover<CR>", { desc = "Find project" })
map("n", "<localleader>rs", '<cmd>ToggleTerm<CR><cmd>TermExec cmd="lein repl"<CR>', { desc = "REPL Start" })
map("n", "<leader>gG", function()
  LazyVim.lazygit({ cwd = LazyVim.root.git() })
end, { desc = "Lazygit (Root Dir)" })
map("n", "<leader>gg", function()
  LazyVim.lazygit()
end, { desc = "Lazygit (cwd)" })

-- Block indentation via tab and shift/tab
map("v", "<TAB>", ">gv")
map("v", "<S-TAB>", "<gv")
