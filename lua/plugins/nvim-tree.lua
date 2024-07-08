return {
	{ -- A File Explorer
		"nvim-tree/nvim-tree.lua",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1

			require("nvim-tree").setup({
				view = {
					number = true,
					relativenumber = true,
				},
				actions = {
					open_file = {
						quit_on_open = true,
					},
				},
			})
			vim.keymap.set("n", "<C-n>", ":NvimTreeFindFileToggle<CR>", { desc = "Toggles file explorer" })
		end,
	},
}
