return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    opts.options.globalstatus = false
    opts.sections.lualine_b = {}
    opts.sections.lualine_z = {}
  end,
}
