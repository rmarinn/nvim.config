vim.pack.add({
	'https://github.com/nvim-lua/plenary.nvim',
	'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
	{ src = 'https://github.com/nvim-telescope/telescope.nvim', version = 'v0.2.2' },
	'https://github.com/nvim-telescope/telescope-ui-select.nvim',
	'https://github.com/nvim-tree/nvim-web-devicons',
})

local builtin = require('telescope.builtin')
pcall(require('telescope').load_extension, 'fzf')

vim.keymap.set('n', '<leader>sn', function()
	builtin.find_files({ cwd = vim.fn.stdpath('config') })
end, { desc = 'Telescope nvim config' })
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = 'Telescope Keymaps' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = 'Telescope diagnostics' })
vim.keymap.set('n', '<leader>sc', builtin.commands, { desc = 'Telescope commands' })
vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = 'Telescope Resume' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = 'Telescope word' })
vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = 'Telescope buffers' })

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local map = function(keys, func, desc)
			vim.keymap.set('n', keys, func, { buffer = ev.buf, desc = 'LSP: ' .. desc })
		end

		map('<leader>gr', builtin.lsp_references, 'References')
		map('<leader>gd', builtin.lsp_definitions, 'Type definition')
		map('<leader>ds', builtin.lsp_document_symbols, 'Show document symbols')
		map('<leader>ds', builtin.lsp_document_symbols, 'Show document symbols')
		map('<leader>gI', builtin.lsp_implementations, 'Implementations')
		map('<leader>D', builtin.lsp_type_definitions, 'Type definitions')
	end,
})

local zig_std_dir
vim.keymap.set('n', '<leader>sz', function()
	if not zig_std_dir then
		local result = vim.system({ 'zig', 'env' }):wait()

		-- search globally for .std_dir = "..." anywhere in the output
		zig_std_dir = result.stdout:match('%.std_dir%s*=%s*"([^"]+)"')

		if not zig_std_dir then
			print('Error: Could not find std_dir from `zig env`')
			print('Full output:\n' .. result.stdout)
		end
	end

	if not zig_std_dir then
		print('Error: Could not find zig std_dir')
	end

	builtin.find_files({ cwd = zig_std_dir })
end, { desc = 'Telescope zig std' })
