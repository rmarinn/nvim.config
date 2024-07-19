return {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	dependencies = {
		-- `friendly-snippets` contains a variety of premade snippets.
		--    See the README about individual language/framework/plugin snippets:
		--    https://github.com/rafamadriz/friendly-snippets
		{
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
	},
}
