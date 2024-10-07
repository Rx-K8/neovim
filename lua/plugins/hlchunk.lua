return {
	"shellRaining/hlchunk.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = { chunk = { enable = true }, blank = {chars= {"⁙"}, enable = true } },
	-- config = function()
	-- 	require("hlchunk").setup({})
	-- end,
}
