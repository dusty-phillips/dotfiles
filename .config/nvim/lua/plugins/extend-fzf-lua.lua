return {
  "ibhagwan/fzf-lua",
  opts = function(_, opts)
    local fzf = require("fzf-lua")
    local config = fzf.config
    config.defaults.keymap.fzf["ctrl-a"] = "select-all"
    return opts
  end,
}
