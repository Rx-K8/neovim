local options = {
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black", "isort" },
	},

	format_on_save = {
		timeout_ms = 1000,
		lsp_fallback = true,
	},
}

return options
