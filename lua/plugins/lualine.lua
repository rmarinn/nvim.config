return {
	-- statusline themeing
	"nvim-lualine/lualine.nvim",
	opts = {
		icons_enabled = true,
		colorscheme = "dracula-nvim",
	},
	sections = {
		lualine_a = { "filename", path = 1 },
	},
}
