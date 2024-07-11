return {
  "CopilotC-Nvim/CopilotChat.nvim",
  keys = {
    {
      "<leader>aa",
      function()
        return require("CopilotChat").open()
      end,
      desc = "CopilotChat",
      mode = { "n", "v" },
    },
    {
      "<leader>aA",
      function()
        return require("CopilotChat").close()
      end,
      desc = "Close (CopilotChat)",
      mode = { "n", "v" },
    },
  },
}
