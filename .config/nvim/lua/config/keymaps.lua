-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<C-w>N", "<cmd>enew<cr>", { desc = "New File in Current Window" })
vim.keymap.set("n", "<leader>wN", "<cmd>enew<cr>", { desc = "New File in Current Window" })
vim.keymap.set("n", "<leader>r", "<cmd>LspRestart<cr>", { desc = "Restart LSP" })
vim.keymap.set("n", "<leader>xc", "<cmd>Trouble close<cr>", { desc = "Close Trouble Window" })
vim.keymap.set("n", "<D-s>", "<cmd>w<cr>", { desc = "Save" })
vim.keymap.set("i", "<D-s>", "<Esc><cmd>w<cr>a", { desc = "Save" })

vim.keymap.set("n", "<leader><delete>", function()
  Snacks.bufdelete()
end, { desc = "Close Buffer" })
vim.keymap.set("n", "<leader><CR>", Snacks.bufdelete.all, { desc = "Close All Buffers" })
vim.keymap.set("n", "<leader>bo", Snacks.bufdelete.other, { desc = "Close Other Buffers" })
