return {
  "nvimdev/dashboard-nvim",
  opts = function(_, opts)
    table.insert(opts.config.center, 7, {
      action = function()
        require("persistence").select()
      end,
      desc = "Select Session",
      icon = "󰁯  ",
      key = "S",
      key_format = "  %s",
    })
  end,
}
