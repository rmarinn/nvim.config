return {
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			icons_enabled = false,
			theme = "catppuccin",
		},
		sections = {
			lualine_a = { "filename", path = 1 },
		},
	},
}
