return {
	-- allows the usage of '%' for html tags
	"andymass/vim-matchup",
	version = "v0.7.*",
	config = function()
		local tsconfig = require("nvim-treesitter.configs")

		tsconfig.setup({
			matchup = {
				enable = true,
			},
		})
	end,
}
