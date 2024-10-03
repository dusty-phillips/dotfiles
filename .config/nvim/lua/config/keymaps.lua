-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<C-w>N", "<cmd>enew<cr>", { desc = "New file in current window" })
vim.keymap.set("n", "<leader>wN", "<cmd>enew<cr>", { desc = "New file in current window" })
vim.keymap.set("n", "<leader>r", "<cmd>LspRestart<cr>", { desc = "Restart LSP" })
vim.keymap.set("n", "<leader>xc", "<cmd>Trouble close<cr>", { desc = "Close trouble window" })
vim.keymap.set("n", "<D-s>", "<cmd>w<cr>", { desc = "Save" })
