return {
  "mrcjkb/rustaceanvim",
  opts = function(_, opts)
    opts.server = opts.server or {}
    opts.server.settings = opts.server.settings or {}
    opts.server.settings["rust-analyzer"] = vim.tbl_deep_extend("force", opts.server.settings["rust-analyzer"] or {}, {
      checkOnSave = {
        command = "check",
        -- Alternatively, to disable all checks on save:
        -- enable = false,
      },
    })
    return opts
  end,
}
