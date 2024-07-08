return {
	{ -- statusline themeing
		"nvim-lualine/lualine.nvim",
		opts = {
			icons_enabled = true,
			theme = "catppuccin",
		},
		sections = {
			lualine_a = { "filename", path = 1 },
		},
	},
}
