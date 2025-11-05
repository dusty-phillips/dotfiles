return {
  "mrjones2014/smart-splits.nvim",
  build = "./kitty/install-kittens.bash",
  keys = {
    {
      "<C-A-Left>",
      mode = { "n", "v" },
      function()
        require("smart-splits").move_cursor_left()
      end,
      desc = "Move to left window",
    },
    {
      "<C-A-Right>",
      mode = { "n", "v" },
      function()
        require("smart-splits").move_cursor_right()
      end,
      desc = "Move to right window",
    },
    {
      "<C-A-j>",
      mode = { "n", "v" },
      function()
        require("smart-splits").move_cursor_down()
      end,
      desc = "Move to below window",
    },
    {
      "<C-A-k>",
      mode = { "n", "v" },
      function()
        require("smart-splits").move_cursor_up()
      end,
      desc = "Move to above window",
    },
  },
}
