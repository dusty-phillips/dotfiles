return {
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
}
