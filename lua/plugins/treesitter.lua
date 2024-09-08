return {
	-- Highlight, edit, and navigate code
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
	build = ":TSUpdate",
	lazy = false,
	opts = {
		ensure_installed = { "diff", "lua", "luadoc", "markdown", "vim", "vimdoc" },
		auto_install = true,
		highlight = { enable = true, use_languagetree = true },
		indent = { enable = true },
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
