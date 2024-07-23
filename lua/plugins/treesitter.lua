return {
	{
		{ -- Highlight, edit, and navigate code
			"nvim-treesitter/nvim-treesitter",
			version = "v0.9.*",
			build = ":TSUpdate",
			lazy = false,
			opts = {
				-- to get a list of all supported languages, use `:TSInstallInfo`
				ensure_installed = { "diff", "lua", "luadoc", "markdown", "vim", "vimdoc" },

				-- Autoinstall languages that are not installed
				auto_install = true,
				highlight = {
					enable = true,
					-- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
					--  If you are experiencing weird indenting issues, add the language to
					--  the list of additional_vim_regex_highlighting and disabled languages for indent.
					additional_vim_regex_highlighting = { "ruby" },
				},
				indent = { enable = true, disable = { "ruby" } },
			},
			config = function(_, opts)
				-- [[ Configure Treesitter ]] See `:help nvim-treesitter`

				-- set compilers
				require("nvim-treesitter.install").compilers = { "gcc", "clang", "clangd" }

				-- Prefer git instead of curl in order to improve connectivity in some environments
				require("nvim-treesitter.install").prefer_git = false

				---@diagnostic disable-next-line: missing-fields
				require("nvim-treesitter.configs").setup(opts)

				-- There are additional nvim-treesitter modules that you can use to interact
				-- with nvim-treesitter. You should go explore a few and see what interests you:
				--    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
				--    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
				--    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
			end,
		},
	},
}
