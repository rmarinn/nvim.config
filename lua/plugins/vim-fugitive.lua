return {
	-- A git wrapper
	"tpope/vim-fugitive",
	version = "v3.7",
	config = function()
		vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
	end,
}
