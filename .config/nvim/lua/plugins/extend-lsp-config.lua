return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        css_variables = {
          filetypes = { "css", "scss", "less", "svelte" },
        },
      },
    },
  },
}
