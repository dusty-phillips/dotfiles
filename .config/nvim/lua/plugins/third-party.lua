return {
  {
    "mrjones2014/smart-splits.nvim",
    build = "./kitty/install-kittens.bash",
    keys = {
      {
        "<A-Left>",
        mode = { "n", "v" },
        function()
          require("smart-splits").move_cursor_left()
        end,
        desc = "Move to left window",
      },
      {
        "<A-Right>",
        mode = { "n", "v" },
        function()
          require("smart-splits").move_cursor_right()
        end,
        desc = "Move to right window",
      },
      {
        "<A-j>",
        mode = { "n", "v" },
        function()
          require("smart-splits").move_cursor_down()
        end,
        desc = "Move to below window",
      },
      {
        "<A-k>",
        mode = { "n", "v" },
        function()
          require("smart-splits").move_cursor_up()
        end,
        desc = "Move to above window",
      },
    },
  },
  {
    "nmac427/guess-indent.nvim",
    lazy = false,
    opts = { auto_cmd = true, override_editorconfig = true },
  },
  {
    "axkirillov/hbac.nvim",
    opts = {
      threshold = 4,
    },
  },
  {
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
  },
}
