return {
  "nvim-mini/mini.files",
  keys = {
    {
      "<leader>e",
      function()
        require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
      end,
      desc = "Open mini.files (directory of current file)",
    },
    {
      "<leader>E",
      function()
        require("mini.files").open(vim.loop.cwd(), true)
      end,
      desc = "Open mini.files (cwd)",
    },
    {
      "<leader>fm",
      function()
        require("mini.files").open(LazyVim.root(), true)
      end,
      desc = "Open mini.files (root)",
    },
  },
  opts = {
    mappings = {
      go_in = "<Right>",
      go_out = "<Left>",
      go_in_plus = "<S-Right>",
      go_out_plus = "<S-Left>",
      go_in_vertical = "<C-V>",
      go_in_horizontal = "<C-S>",
      go_in_vertical_plus = "<C-V>",
      go_in_horizontal_plus = "<C-S>",
      toggle_hidden = ";.",
      change_cwd = ";c",
    },
    windows = {
      width_nofocus = 20,
      width_focus = 50,
      width_preview = 100,
    },
    options = {
      use_as_default_explorer = true,
    },
  },
}
