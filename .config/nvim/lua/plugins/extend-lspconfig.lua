return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      rescriptls = {},
      gopls = {
        settings = {
          gopls = {
            buildFlags = { "-tags=test" },
          },
        },
      },
    },
  },
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    keys[#keys + 1] =
      { "<leader>a", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" }, has = "codeAction" }
  end,
}
