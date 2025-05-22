return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.6",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local theme = {
      border = true,
      borderchars = {
        preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
        results = { " " },
      },
      layout_config = {
        height = 25,
      },
      layout_strategy = "bottom_pane",
      sorting_strategy = "ascending",
      theme = "ivy",
    }

    require("telescope").setup({
      defaults = {
        mappings = {
          i = { ["<C-h>"] = "which_key" },
        },
      },
      pickers = {
        find_files = theme,
        live_grep = theme,
        buffers = theme,
        help_tags = theme,
        highlights = theme,
        lsp_references = theme,
        lsp_definitions = theme,
      },
    })

    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
    vim.keymap.set("n", "<leader>fc", function()
      builtin.find_files({ cwd = vim.fn.stdpath("config") })
    end, { desc = "Find Config" })

    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Grep Files" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help Pages" })
    vim.keymap.set("n", "<leader>fl", builtin.highlights, { desc = "Highlights" })
  end,
}
