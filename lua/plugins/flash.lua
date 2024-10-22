return {
	"folke/flash.nvim",
	evnt = "VeryLazy",
	---@type Flash.Config
	opts = {
		modes = { search = { enabled = true } },
	},
	keys = {
		{
			"/",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump()
			end,
			desc = "Flash",
		},
		{
			"//",
			mode = { "n", "x", "o" },
			function()
				require("flash").treesitter()
			end,
			desc = "Flash Treesitter",
		},
	},
}
