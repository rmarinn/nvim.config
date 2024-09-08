return {
	{
		-- Detect tabstop and shiftwidth automatically
		"tpope/vim-sleuth",
	},

	{
		-- "gc" to comment visual regions/lines
		"numToStr/Comment.nvim",
		opts = {},
	},

	{
		"echasnovski/mini.nvim",
		version = "*",
		config = function()
			require("mini.ai").setup({ n_lines = 500 })
			require("mini.surround").setup()
		end,
	},
}
