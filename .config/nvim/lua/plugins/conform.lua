return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				html = { { "prettierd", "prettier" } },
				css = { { "prettierd", "prettier" } },
				javascript = { { "prettierd", "prettier" } },
				typescript = { { "prettierd", "prettier" } },
				javascriptreact = { { "prettierd", "prettier" } },
				typescriptreact = { { "prettierd", "prettier" } },
				rust = { "rustfmt" },
				markdown = { "prettierd", "prettier" },
			},
			format_on_save = function(bufnr)
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end
				return { timeout_ms = 1000, lsp_fallback = true }
			end,
		})

		vim.api.nvim_create_user_command("FormatToggle", function(args)
			if args.bang then
				vim.b.disable_autoformat = not vim.b.disable_autoformat
				if vim.b.disable_autoformat then
					vim.notify("autoformat-on-save disabled for this buffer")
				else
					vim.notify("autoformat-on-save enabled for this buffer")
				end
			else
				vim.g.disable_autoformat = not vim.g.disable_autoformat
				if vim.g.disable_autoformat then
					vim.notify("autoformat-on-save disabled globally")
				else
					vim.notify("autoformat-on-save enabled globally")
				end
			end
		end, {
			desc = "Toggle autoformat-on-save",
			bang = true,
		})

		vim.keymap.set("n", "<leader>uf", "<cmd>FormatToggle<cr>", { silent = true, desc = "Toggle Format" })
	end,
}
