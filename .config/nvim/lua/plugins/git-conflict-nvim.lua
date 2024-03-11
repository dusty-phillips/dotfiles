return {
  "akinsho/git-conflict.nvim",
  opts = {
    default_mappings = {
      ours = ";o",
      theirs = ";t",
      none = ";0",
      both = ";b",
      next = "]x",
      prev = "[x",
    },
  },
  keys = {
    { "<leader>gx", "<cmd>GitConflictListQf<cr>", desc = "List Conflicts" },
    { "<leader>gr", "<cmd>GitConflictRefresh<cr>", desc = "Refresh Conflicts" },
  },
}
