return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {},
	config = function()
		local wk = require("which-key")
		wk.register({
			f = { name = "+Find" },
			b = { name = "+Buffer" },
			x = { name = "+Trouble" },
		}, { prefix = "<leader>" })
	end,
}
