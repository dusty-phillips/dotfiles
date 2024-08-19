return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        css_variables = {
          filetypes = { "css", "scss", "less", "svelte" },
        },
        roc_ls = {},
      },
    },
  },
}
