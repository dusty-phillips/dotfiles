return {
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
}
