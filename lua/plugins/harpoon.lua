vim.pack.add({
	'https://github.com/nvim-lua/plenary.nvim',
	{
		src = 'https://github.com/ThePrimeagen/harpoon',
		version = 'harpoon2',
	},
})

local harpoon = require('harpoon')

harpoon:setup({})

vim.keymap.set('n', '<leader>a', function()
	harpoon:list():add()
end)

vim.keymap.set('n', '<C-e>', function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set('n', '<C-a>', function()
	harpoon:list():select(1)
end)
vim.keymap.set('n', '<C-s>', function()
	harpoon:list():select(2)
end)
vim.keymap.set('n', '<C-d>', function()
	harpoon:list():select(3)
end)
vim.keymap.set('n', '<C-f>', function()
	harpoon:list():select(4)
end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set('n', '<leader>p', function()
	harpoon:list():prev()
end)
vim.keymap.set('n', '<leader>n', function()
	harpoon:list():next()
end)
