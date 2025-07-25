if vim.tbl_contains(LazyVim.config.json.data.extras, "lazyvim.plugins.extras.ui.treesitter-rewrite") then
  if vim.fn.executable("tree-sitter") == 0 then
    LazyVim.error("**treesitter-rewrite** requires the `tree-sitter` executable to be installed")
    return {}
  end

  if vim.fn.has("nvim-0.10") == 0 then
    LazyVim.error("**treesitter-rewrite** requires Neovim >= 0.10")
    return {}
  end
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false, -- last release is way too old and doesn't work on Windows
    branch = "main",
    build = ":TSUpdate",
    lazy = false,
    cmd = {},
    opts = function()
      return {
        highlight = { enable = true },
        indent = { enable = true },
        ensure_install = {
          "bash",
          "c",
          "diff",
          "html",
          "javascript",
          "jsdoc",
          "json",
          "jsonc",
          "lua",
          "luadoc",
          "luap",
          "markdown",
          "markdown_inline",
          "python",
          "query",
          "regex",
          "toml",
          "tsx",
          "typescript",
          "vim",
          "vimdoc",
          "xml",
          "yaml",
        },
      }
    end,
    init = function() end,
    ---@param opts TSConfig
    config = function(_, opts)
      ---@return string[]
      local function norm(ensure)
        return ensure == nil and {} or type(ensure) == "string" and { ensure } or ensure
      end

      -- ensure_installed is deprecated, but still supported
      opts.ensure_install = LazyVim.dedup(vim.list_extend(norm(opts.ensure_install), norm(opts.ensure_installed)))

      require("nvim-treesitter").setup(opts)
      -- by @dpetka2001
      -- needed to install the parsers
      require("nvim-treesitter").install(opts.ensure_install)

      -- backwards compatibility with the old treesitter config for indent
      if vim.tbl_get(opts, "indent", "enable") then
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end

      -- backwards compatibility with the old treesitter config for highlight
      if vim.tbl_get(opts, "highlight", "enable") then
        vim.api.nvim_create_autocmd("FileType", {
          callback = function()
            pcall(vim.treesitter.start)
          end,
        })
      end
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    enabled = false,
  },
  {
    "windwp/nvim-ts-autotag",
    -- dev = true,
    enabled = true,
  },
  {
    "RRethy/vim-illuminate",
    optional = true,
    enabled = false,
  },
}
