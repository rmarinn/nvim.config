vim.pack.add({
	'https://github.com/nvim-treesitter/nvim-treesitter',
	'https://github.com/nvim-treesitter/nvim-treesitter-context',
})

local ts = require('nvim-treesitter')
local tsc = require('treesitter-context')

ts.install({ 'diff', 'lua', 'luadoc', 'markdown', 'vim', 'vimdoc', 'zig', 'rust' }, {
	generate = true,
})

tsc.setup({
	enable = false,
  separator = '―',
})
vim.keymap.set('n', '[c', function()
	tsc.go_to_context(vim.v.count1)
end, { silent = true, desc = 'Jump to the start of the function' })
vim.keymap.set('n', ']c', function()
	tsc.toggle()
end, { silent = true, desc = 'Toggle treesitter context' })
