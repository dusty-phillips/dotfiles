return {
  {
    "akinsho/bufferline.nvim",
    keys = {
      {
        "<S-Right>",
        function()
          vim.cmd("bnext " .. vim.v.count1)
        end,
        desc = "Next buffer",
      },
      {
        "<S-Left>",
        function()
          vim.cmd("bprev " .. vim.v.count1)
        end,
        desc = "Previous buffer",
      },
      { "<leader><CR>", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Close Unpinned Buffers" },
      { "<leader><delete>", LazyVim.ui.bufremove, desc = "Close current buffer" },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Right>"] = cmp.mapping.confirm({ select = true }),
        ["<CR>"] = function(fallback)
          cmp.abort()
          fallback()
        end,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] =
        { "<leader>a", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" }, has = "codeAction" }
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["markdown"] = { "prettier" },
        ["yaml"] = { "prettier" },
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    keys = {
      { "<leader>hs", "<cmd>Gitsigns stage_hunk<cr>", desc = "Stage Hunk" },
      { "<leader>hS", "<cmd>Gitsigns stage_buffer<cr>", desc = "Stage Buffer" },
      { "<leader>hr", "<cmd>Gitsigns reset_hunk<cr>", desc = "Reset Hunk" },
      { "<leader>hR", "<cmd>Gitsigns reset_buffer<cr>", desc = "Reset Buffer" },
      { "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<cr>", desc = "Undo Stage Hunk" },
    },
  },
}
