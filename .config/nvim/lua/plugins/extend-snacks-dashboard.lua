return {
  "snacks.nvim",
  opts = function(_, opts)
    table.insert(
      opts.dashboard.preset.keys,
      7,
      { icon = "󰼢", key = "S", desc = "Select Session", action = require("persistence").select }
    )
    opts.dashboard.sections = {
      { section = "header" },
      {
        pane = 2,
        section = "terminal",
        cmd = "echo '\n\n' ; pwd",
        height = 8,
        padding = 1,
      },
      { section = "keys", gap = 1, padding = 1 },
      { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
      { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
      {
        pane = 2,
        icon = " ",
        title = "Git Status",
        section = "terminal",
        enabled = function()
          return Snacks.git.get_root() ~= nil
        end,
        cmd = "git status --short --branch --renames",
        height = 5,
        padding = 1,
        ttl = 5 * 60,
        indent = 3,
      },
      { section = "startup" },
    }
  end,
}
