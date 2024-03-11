return {
  "chrisgrieser/nvim-various-textobjs",
  lazy = true,
  keys = {
    -- Overwrite word with subword to match spider
    { "iw", "<cmd>lua require('various-textobjs').subword('inner')<CR>", mode = { "o", "x" }, desc = "Inner subword" },
    { "aw", "<cmd>lua require('various-textobjs').subword('outer')<CR>", mode = { "o", "x" }, desc = "Outer subword" },

    { "ie", "<cmd>lua require('various-textobjs').entireBuffer()<CR>", mode = { "o", "x" }, desc = "Entire Buffer" },

    {
      "iv",
      "<cmd>lua require('various-textobjs').value('inner')<CR>",
      mode = { "o", "x" },
      desc = "Inner value of KV pair",
    },
    {
      "av",
      "<cmd>lua require('various-textobjs').value('outer')<CR>",
      mode = { "o", "x" },
      desc = "Outer value of KV pair",
    },

    {
      "ik",
      "<cmd>lua require('various-textobjs').key('inner')<CR>",
      mode = { "o", "x" },
      desc = "Inner Key of KV Pair",
    },
    {
      "ak",
      "<cmd>lua require('various-textobjs').key('outer')<CR>",
      mode = { "o", "x" },
      desc = "Outer Key of KV Pair",
    },

    { "iu", "<cmd>lua require('various-textobjs').url()<CR>", mode = { "o", "x" }, desc = "Url" },

    { "id", "<cmd>lua require('various-textobjs').diagnostic()<CR>", mode = { "o", "x" }, desc = "Diagnostic" },

    {
      "iC",
      "<cmd>lua require('various-textobjs').mdFencedCodeBlock('inner')<CR>",
      mode = { "o", "x" },
      ft = { "markdown" },
      desc = "Inner markdown Code Block",
    },
    {
      "aC",
      "<cmd>lua require('various-textobjs').mdFencedCodeBlock('outer')<CR>",
      mode = { "o", "x" },
      ft = { "markdown" },
      desc = "Outer markdown Code Block",
    },

    {
      "ix",
      "<cmd>lua require('various-textobjs').htmlAttribute('inner')<CR>",
      mode = { "o", "x" },
      desc = "inner HTML attribute",
    },
    {
      "ax",
      "<cmd>lua require('various-textobjs').htmlAttribute('outer')<CR>",
      mode = { "o", "x" },
      desc = "outer HTML attribute",
    },
  },
}
