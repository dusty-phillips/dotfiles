return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  branch = "main",
  event = "VeryLazy",
  keys = {
    -- Selection textobjects
    {
      "af",
      function()
        require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
      end,
      mode = { "n", "x", "o" },
      desc = "Select outer function",
    },
    {
      "if",
      function()
        require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
      end,
      mode = { "n", "x", "o" },
      desc = "Select inner function",
    },
    {
      "ac",
      function()
        require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
      end,
      mode = { "n", "x", "o" },
      desc = "Select outer class",
    },
    {
      "ic",
      function()
        require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
      end,
      mode = { "n", "x", "o" },
      desc = "Select inner class",
    },
    {
      "aa",
      function()
        require("nvim-treesitter-textobjects.select").select_textobject("@parameter.outer", "textobjects")
      end,
      mode = { "n", "x", "o" },
      desc = "Select outer parameter",
    },
    {
      "ia",
      function()
        require("nvim-treesitter-textobjects.select").select_textobject("@parameter.inner", "textobjects")
      end,
      mode = { "n", "x", "o" },
      desc = "Select inner parameter",
    },

    -- Movement textobjects
    {
      "]f",
      function()
        require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
      end,
      mode = { "n", "x", "o" },
      desc = "Next function start",
    },
    {
      "[f",
      function()
        require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
      end,
      mode = { "n", "x", "o" },
      desc = "Previous function start",
    },
    {
      "]F",
      function()
        require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
      end,
      mode = { "n", "x", "o" },
      desc = "Next function end",
    },
    {
      "[F",
      function()
        require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
      end,
      mode = { "n", "x", "o" },
      desc = "Previous function end",
    },
    {
      "]c",
      function()
        if vim.wo.diff then
          vim.cmd("normal! ]c")
        else
          require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
        end
      end,
      mode = { "n", "x", "o" },
      desc = "Next class start / diff hunk",
    },
    {
      "[c",
      function()
        if vim.wo.diff then
          vim.cmd("normal! [c")
        else
          require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
        end
      end,
      mode = { "n", "x", "o" },
      desc = "Previous class start / diff hunk",
    },
    {
      "]C",
      function()
        require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects")
      end,
      mode = { "n", "x", "o" },
      desc = "Next class end",
    },
    {
      "[C",
      function()
        require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects")
      end,
      mode = { "n", "x", "o" },
      desc = "Previous class end",
    },
    {
      "]a",
      function()
        require("nvim-treesitter-textobjects.move").goto_next_start("@parameter.inner", "textobjects")
      end,
      mode = { "n", "x", "o" },
      desc = "Next parameter",
    },
    {
      "[a",
      function()
        require("nvim-treesitter-textobjects.move").goto_previous_start("@parameter.inner", "textobjects")
      end,
      mode = { "n", "x", "o" },
      desc = "Previous parameter",
    },
    {
      "]A",
      function()
        require("nvim-treesitter-textobjects.move").goto_next_end("@parameter.inner", "textobjects")
      end,
      mode = { "n", "x", "o" },
      desc = "Next parameter end",
    },
    {
      "[A",
      function()
        require("nvim-treesitter-textobjects.move").goto_previous_end("@parameter.inner", "textobjects")
      end,
      mode = { "n", "x", "o" },
      desc = "Previous parameter end",
    },
  },
  config = function()
    -- Any additional setup if needed
  end,
}
