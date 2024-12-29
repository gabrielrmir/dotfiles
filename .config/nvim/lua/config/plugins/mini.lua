return {
  "echasnovski/mini.nvim",
  version = '*',
  config = function()
    require('mini.tabline').setup({
      set_vim_settings = true,
      tabpage_section = 'none',
    })

    vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<cr>", { desc = "Previous tab" })
    vim.keymap.set("n", "<Tab>", "<cmd>bnext<cr>", { desc = "Next tab" })
    vim.keymap.set("n", "<leader>bd", "<cmd>bd!<cr>", { desc = "Delete buffer" })
  end
}
