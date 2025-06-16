return {
  {
    "olimorris/codecompanion.nvim",
    opts = {
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        {
          "saghen/blink.cmp",
          opts = {
            sources = {
              default = { "codecompanion" },
              providers = {
                codecompanion = {
                  name = "CodeCompanion",
                  module = "codecompanion.providers.completion.blink",
                  enabled = true,
                },
              },
            },
          },
        },
      },
      strategies = {
        chat = {
          adapter = "copilot",
          model = "claude-sonnet-4-20250514",
        },
      },
    },
    keys = {
      { "<leader>aa", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "Code Companion Actions" },
      { "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "Code Companion Chat" },
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
