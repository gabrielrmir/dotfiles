return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      require("mason").setup({
        ui = {
          border = "rounded",
          width = 0.8,
          height = 0.9,
          icons = {
            package_installed = "◍",
            package_pending = "◍",
            package_uninstalled = "◍",
          },
        },
      })
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls" }
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
          if client.server_capabilities.completionProvider then
            vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
          end
          if client.server_capabilities.definitionProvider then
            vim.opt_local.tagfunc = "v:lua.vim.lsp.tagfunc"
          end

          local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, {
              buffer = 0, noremap = true, silent = true, desc = desc
            })
          end

          local builtin = require('telescope.builtin')

          map("n", "K", vim.lsp.buf.hover, "Hover")

          map("n", "gd", builtin.lsp_definitions, "LSP Definitions")
          map("n", "gD", vim.lsp.buf.declaration, "LSP Declarations")
          map("n", "gi", vim.lsp.buf.implementation, "LSP Implementations")
          map("n", "gt", vim.lsp.buf.type_definition, "LSP Typedef")
          map("n", "gr", builtin.lsp_references, "LSP References")
          map("n", "gh", vim.lsp.buf.signature_help, "Signature Help")

          map("n", "<space>cr", vim.lsp.buf.rename, "Rename Symbol")
          map("n", "<space>ca", vim.lsp.buf.code_action, "Code Action")

          -- map("n", "<space>q", vim.diagnostic.setloclist, "Loclist")
          map("n", "<space>q", builtin.diagnostics, "Diagnostics")
        end,
      })

      local autoconfig_servers = {
        "lua_ls",
        "pyright",
        "marksman",
        "html",
        "intelephense",
        "cssls",
        "tailwindcss",
        "ts_ls",
        "clangd",
        "gopls",
      }

      for _, server in ipairs(autoconfig_servers) do
        lspconfig[server].setup({
          capabilities = capabilities,
        })
      end

      lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
        settings = {
          ["rust-analyzer"] = {
            diagnostics = {
              enable = false,
            },
          },
        },
      })
    end,
  },
}
