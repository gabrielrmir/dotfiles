return {
	"rcarriga/nvim-notify",
	config = function()
		require("notify").setup({
			top_down = true,
			minimum_width = 0,
			stages = "static",
			render = "minimal",
		})
		local notify = require("notify")
		vim.notify = notify
	end,
}
