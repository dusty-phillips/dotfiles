return {
  "chrisgrieser/nvim-rip-substitute",
  keys = {
    {
      "g/",
      function()
        require("rip-substitute").sub()
      end,
      mode = { "n", "x" },
      desc = "Rip Substitute",
    },
  },
}
