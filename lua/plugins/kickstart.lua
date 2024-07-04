return {
	-- Detect tabstop and shiftwidth automatically
	{ "tpope/vim-sleuth" },

	-- "gc" to comment visual regions/lines
	{ "numToStr/Comment.nvim", opts = {} },

	-- See `:help gitsigns` to understand what the configuration keys do
	{ -- Adds git related signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},

	-- Show pending keybinds.
	-- {
	-- 	"folke/which-key.nvim",
	-- 	event = "VimEnter", -- Sets the loading event to 'VimEnter'
	-- 	config = function() -- This is the function that runs, AFTER loading
	-- 		require("which-key").setup()
	--
	-- 		-- Document existing key chains
	-- 		require("which-key").register({
	-- 			["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
	-- 			["<leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },
	-- 			["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
	-- 			["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
	-- 			["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
	-- 			["<leader>t"] = { name = "[T]oggle", _ = "which_key_ignore" },
	-- 			["<leader>h"] = { name = "Git [H]unk", _ = "which_key_ignore" },
	-- 		})
	--
	-- 		-- visual mode
	-- 		require("which-key").register({
	-- 			["<leader>h"] = { "Git [H]unk" },
	-- 		}, { mode = "v" })
	-- 	end,
	-- },
}
