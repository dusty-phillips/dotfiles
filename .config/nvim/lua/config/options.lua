-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.number = false
vim.opt.relativenumber = false
vim.opt.shell = "/usr/local/bin/fish"
vim.opt.ignorecase = false

if vim.g.neovide then
  vim.o.guifont = "VictorMono Nerd Font"
  vim.g.neovide_input_macos_alt_is_meta = true
end
