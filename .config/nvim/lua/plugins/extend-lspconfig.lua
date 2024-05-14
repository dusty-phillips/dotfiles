return {
  "neovim/nvim-lspconfig",
  opts = {
    settings = {
      gopls = {
        buildFlags = { "-tags=test" },
      },
    },
    servers = {
      rescriptls = {},
    },
  },
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    keys[#keys + 1] =
      { "<leader>a", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" }, has = "codeAction" }
  end,
}
