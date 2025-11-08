-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.backupcopy = "yes"
vim.opt.shell = "/opt/homebrew/bin/fish"
vim.opt.ignorecase = false
-- vim.opt.cursorcolumn = true
vim.opt.background = "dark"
vim.opt.number = false
vim.opt.relativenumber = false
vim.g.lazyvim_python_lsp = "basedpyright"

-- by @dpetka2001Add commentMore actions
-- needed to make sure the spec of the Extra gets added first, so other Extras can add onto it
-- See also treesitter-rewrite.lua
vim.g.xtras_prios = {
  ["plugins.extras.ui.treesitter-rewrite"] = 2,
}
