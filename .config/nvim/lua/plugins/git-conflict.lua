return {
  "akinsho/git-conflict.nvim",
  opts = {
    default_mappings = {
      ours = "<leader>ho",
      theirs = "<leader>ht",
      none = "<leader>h0",
      both = "<leader>hb",
      next = "]x",
      prev = "[x",
    },
  },
  keys = {
    { "<leader>gx", "<cmd>GitConflictListQf<cr>", desc = "List Conflicts" },
    { "<leader>gr", "<cmd>GitConflictRefresh<cr>", desc = "Refresh Conflicts" },
  },
}
