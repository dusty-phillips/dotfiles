return {
  {
    "mrjones2014/smart-splits.nvim",
    build = "./kitty/install-kittens.bash",
    keys = {
      {
        "<A-Left>",
        function()
          require("smart-splits").move_cursor_left()
        end,
        desc = "Move to left window",
      },
      {
        "<A-Right>",
        function()
          require("smart-splits").move_cursor_right()
        end,
        desc = "Move to right window",
      },
      {
        "<A-j>",
        function()
          require("smart-splits").move_cursor_down()
        end,
        desc = "Move to below window",
      },
      {
        "<A-k>",
        function()
          require("smart-splits").move_cursor_up()
        end,
        desc = "Move to above window",
      },
    },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    lazy = true,
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    opts = {
      debug = false,
      window = {
        width = 0.25,
      },
    },
    keys = {
      {
        "<Leader>ch",
        ":'<,'>CopilotChat<CR>",
        mode = { "v" },
        desc = "Copilot Chat Selection",
      },
      {
        "<Leader>ch",
        ":CopilotChatToggle<CR>",
        mode = { "n" },
        desc = "Toggle Copilot Chat",
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
  },
}
