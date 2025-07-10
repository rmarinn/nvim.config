return {
	{
		-- Detect tabstop and shiftwidth automatically
		"tpope/vim-sleuth",
		version = "v2.0"
	},

	{
		-- "gc" to comment visual regions/lines
		"numToStr/Comment.nvim",
		version = "v0.8.\\d+$",
		opts = {},
	},

	{
		"echasnovski/mini.nvim",
		version = "v0.9.\\d+$",
		config = function()
			require("mini.ai").setup({ n_lines = 500 })
			require("mini.surround").setup()
		end,
	},
}
