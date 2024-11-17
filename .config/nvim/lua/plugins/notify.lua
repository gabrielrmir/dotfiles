return {
  "rcarriga/nvim-notify",
  config = function()
    require("notify").setup()
    local notify = require("notify")
    vim.notify = notify
  end,
}
