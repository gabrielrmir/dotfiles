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

      require("mason").setup()
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

          local opts = { buffer = 0, noremap = true, silent = true }

          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "gh", vim.lsp.buf.signature_help, opts)

          vim.keymap.set("n", "<space>cr", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)

          vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)
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
