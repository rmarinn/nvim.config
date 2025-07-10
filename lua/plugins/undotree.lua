return {
	"mbbill/undotree",
	version = "rel_6.1",
	config = function()
		vim.g.undotree_DiffCommand = "vimdiff"
		vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
	end,
}
