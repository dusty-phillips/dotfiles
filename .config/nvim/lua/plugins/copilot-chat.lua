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
  {
    "folke/edgy.nvim",
    event = "VeryLazy",
    opts = {
      exit_when_last = false,
      animate = {
        enabled = false,
      },
      wo = {
        winbar = true,
        winfixwidth = true,
        winfixheight = false,
        winhighlight = "WinBar:EdgyWinBar,Normal:EdgyNormal",
        spell = false,
        signcolumn = "no",
      },
      right = {
        {
          ft = "copilot-chat",
          title = "Copilot",
          size = { width = 0.18 },
        },
      },
    },
  },
}
