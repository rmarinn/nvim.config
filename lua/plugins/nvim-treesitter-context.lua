return {
	"nvim-treesitter/nvim-treesitter-context",
	config = function()
		require("treesitter-context").disable()
		vim.keymap.set("n", "[c", function()
			require("treesitter-context").go_to_context(vim.v.count1)
		end, { silent = true, desc = "Jump to the start of the function" })
		vim.keymap.set("n", "]c", function()
			require("treesitter-context").toggle()
		end, { silent = true, desc = "Toggle treesitter context" })
	end,
}
