return {
	{
		"Mofiqul/dracula.nvim",
		name = "dracula",
		lazy = false,
		opts = {},
		config = function()
			vim.cmd([[colorscheme dracula-soft]])
		end,
	},
}
