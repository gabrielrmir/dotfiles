return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.6",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build =
      'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release'
    }
  },
  config = function()
    require("telescope").setup({
      defaults = {
        mappings = {
          i = {
            ["<C-h>"] = "which_key",
          },
        },
      },
      pickers = {
        find_files = { theme = "ivy" },
        live_grep = { theme = "ivy" },
        buffers = { theme = "ivy" },
        help_tags = { theme = "ivy" },
        highlights = { theme = "ivy" },
        lsp_references = { theme = "ivy" },
        lsp_definitions = { theme = "ivy" },
      },
      extensions = {
        fzf = {}
      },
    })

    require('telescope').load_extension('fzf')
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
