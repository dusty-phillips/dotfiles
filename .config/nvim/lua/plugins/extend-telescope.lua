local Util = require("lazyvim.util")

return {
  "nvim-telescope/telescope.nvim",
  keys = {
    { "<leader><space>", Util.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
  },
  opts = {
    pickers = {
      buffers = {
        mappings = {
          i = {
            ["<A-d>"] = function(...)
              return require("telescope.actions").delete_buffer(...)
            end,
          },
          n = {
            ["<A-d>"] = function(...)
              return require("telescope.actions").delete_buffer(...)
            end,
          },
        },
      },
    },
  },
}
