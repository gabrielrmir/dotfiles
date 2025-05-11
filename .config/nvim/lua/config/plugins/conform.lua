return {
  "stevearc/conform.nvim",
  opts = {},
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        html = { "prettierd", "prettier" },
        css = { "prettierd", "prettier" },
        javascript = { "prettierd", "prettier" },
        typescript = { "prettierd", "prettier" },
        javascriptreact = { "prettierd", "prettier" },
        typescriptreact = { "prettierd", "prettier" },
        rust = { "rustfmt" },
        markdown = { "prettierd", "prettier" },
      },
    })

    vim.keymap.set("n", "<leader>F", conform.format, { desc = "Format file" })
  end,
}
