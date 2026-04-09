vim.cmd.packadd('nvim.undotree')

local undotree = require('undotree')

vim.keymap.set('n', '<leader>u', function()
	undotree.open({ command = 'topleft 30vnew' })
end)
