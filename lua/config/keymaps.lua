-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
map("n", "\\", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "|", "<C-W>v", { desc = "Split Window Right", remap = true })

map("n", "<localleader>rs", "<cmd>Lein<CR>", { desc = "REPL Start" })

map("n", "<leader>p", "<cmd>NeovimProjectDiscover<CR>", { desc = "Find project" })