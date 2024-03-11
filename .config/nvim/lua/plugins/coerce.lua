return {
  "gregorias/coerce.nvim",
  opts = {
    modes = {
      {
        vim_mode = "n",
        keymap_prefix = ",",
        selector = function()
          return require("coerce.selector").select_current_word()
        end,
        transformer = function(selected_region, apply)
          return require("coerce.transformer").transform_lsp_rename_with_failover(
            selected_region,
            apply,
            require("coerce.transformer").transform_local
          )
        end,
      },
      {
        vim_mode = "n",
        keymap_prefix = ",,",
        selector = function()
          return require("coerce.selector").select_with_motion()
        end,
        transformer = function(selected_region, apply)
          return require("coerce.transformer").transform_local(selected_region, apply)
        end,
      },
      {
        vim_mode = "v",
        keymap_prefix = ",",
        selector = function()
          return require("coerce.selector").select_current_visual_selection()
        end,
        transformer = function(selected_region, apply)
          return require("coerce.transformer").transform_local(selected_region, apply)
        end,
      },
    },
  },
}
