-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

if vim.g.neovide then
  vim.defer_fn(function()
    vim.cmd("NeovideFocus")
  end, 100)
end
