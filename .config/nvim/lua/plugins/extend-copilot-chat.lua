return {
  "CopilotC-Nvim/CopilotChat.nvim",
  keys = {
    {
      "<leader>aa",
      function()
        return require("CopilotChat").open()
      end,
      desc = "Toggle (CopilotChat)",
      mode = { "n", "v" },
    },
    {
      "<leader>aA",
      function()
        return require("CopilotChat").close()
      end,
      desc = "Toggle (CopilotChat)",
      mode = { "n", "v" },
    },
  },
}
