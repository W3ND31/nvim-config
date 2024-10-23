-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.g["conjure#mapping#doc_word"] = "K"
vim.g["conjure#mapping#def_word"] = "gd"


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

map("n", "<LEADER>bb", function()
    require("bufferline").pick()
  end, { desc = "Select Buffer" })
  