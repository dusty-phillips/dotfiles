-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "\\", "<C-w>", { desc = "Show Window menu", remap = true })
vim.keymap.set("n", "<leader>xc", "<cmd>TroubleClose<cr>", { desc = "Close Trouble window" })
vim.keymap.set("n", "<leader><CR>", "<Cmd>BufferLineGroupClose ungrouped<CR>", { desc = "Close Unpinned Buffers" })
vim.keymap.set("n", "<leader><delete>", require("mini.bufremove").delete, { desc = "Close current buffer" })

vim.keymap.set("n", "<A-Left>", require("smart-splits").move_cursor_left, { desc = "Move to left window" })
vim.keymap.set("n", "<A-Right>", require("smart-splits").move_cursor_right, { desc = "Move to right window" })
vim.keymap.set("n", "<A-j>", require("smart-splits").move_cursor_down, { desc = "Move to below window" })
vim.keymap.set("n", "<A-k>", require("smart-splits").move_cursor_up, { desc = "Move to above window" })

vim.keymap.set("c", "<Down>", "<Right>", { noremap = true, desc = "select next option" })
vim.keymap.set("c", "<Up>", "<Left>", { noremap = true, desc = "select previous option" })
vim.keymap.set("c", "<Left>", "<Up>", { noremap = true })
vim.keymap.set("c", "<Right>", "<Down>", { noremap = true })
