return {
  {
    "akinsho/git-conflict.nvim",
    lazy = false,
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
      { "<leader>hx", "<cmd>GitConflictListQf<cr>", desc = "List Conflicts" },
      { "<leader>hX", "<cmd>GitConflictRefresh<cr>", desc = "Refresh Conflicts" },
      {
        "<leader>hb",
        function()
          package.loaded.gitsigns.blame_line({ full = true })
        end,
        desc = "Blame Line",
      },
      {
        "<leader>hB",
        function()
          package.loaded.gitsigns.blame()
        end,
        desc = "Blame Buffer",
      },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { mode = { "n", "v" }, { "<leader>h", group = "Git Hunk", icon = "  " } },
      },
    },
  },
}
