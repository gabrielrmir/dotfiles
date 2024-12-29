return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern"
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.add({
      { "<leader>f", group = "find" },
      { "<leader>b", group = "buffer" },
      { "<leader>x", group = "trouble" },
    })
  end,
}
