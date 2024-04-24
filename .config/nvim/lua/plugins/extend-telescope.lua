local Util = require("lazyvim.util")

return {
  { "nvim-telescope/telescope-live-grep-args.nvim" },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        config = function()
          LazyVim.on_load("telescope.nvim", function()
            require("telescope").load_extension("live_grep_args")
          end)
        end,
      },
    },
    keys = {
      { "<leader><space>", Util.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
      {
        "<leader>/",
        function()
          require("telescope").extensions.live_grep_args.live_grep_args()
        end,
        desc = "Grep with Args (root dir)",
      },
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
      extensions = {
        live_grep_args = {
          mappings = {
            i = {
              ["<C-k>"] = function(picker)
                require("telescope-live-grep-args.actions").quote_prompt()(picker)
              end,
            },
          },
        },
      },
    },
  },
}
