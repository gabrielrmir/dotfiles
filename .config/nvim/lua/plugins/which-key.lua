return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    require("which-key").setup({
      icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = ">", -- symbol used between a key and it's label
        group = "+",    -- symbol prepended to a group
      },
    })
    local wk = require("which-key")
    wk.register({
      f = { name = "+Find" },
      b = { name = "+Buffer" },
      x = { name = "+Trouble" },
    }, { prefix = "<leader>" })
  end,
}
