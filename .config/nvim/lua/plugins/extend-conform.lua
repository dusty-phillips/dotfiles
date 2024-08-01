return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["typescript"] = { "prettier" },
        ["markdown"] = { "prettier" },
        ["yaml"] = { "prettier" },
        ["svelte"] = { "prettier" },
        ["html"] = { "prettier" },
      },
    },
  },
}
