local options = {
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
	},

	formatters = {
		-- Python
		black = {
			prepend_args = {
				"--fast",
				"--line-length",
				"79",
			},
		},
		isort = {
			prepend_args = {
				"--profile",
				"black",
			},
		},
	},

	format_on_save = {
		timeout_ms = 1000,
		lsp_fallback = true,
	},
}

return options
