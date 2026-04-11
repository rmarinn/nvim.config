vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	callback = function()
		vim.highlight.on_yank()
	end,
})

local telescope = require('telescope.builtin')

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local map = function(keys, func, desc)
			vim.keymap.set('n', keys, func, { buffer = ev.buf, desc = 'LSP: ' .. desc })
		end

		map('<leader>e', vim.diagnostic.open_float, 'Show diagnostic under cursor')
		map('[d', vim.diagnostic.goto_prev, 'Go to previous diagnostic')
		map(']d', vim.diagnostic.goto_next, 'Go to next diagnostic')
		map('<leader>q', vim.diagnostic.setloclist, 'Show diagnostics quickfix list')
		map('<leader>ca', vim.lsp.buf.code_action, 'Code action')
		map('<leader>rn', vim.lsp.buf.rename, 'Rename')
		map('<leader>gr', telescope.lsp_references, 'References')
		map('<leader>gd', telescope.lsp_definitions, 'Type definition')
		map('<leader>ds', telescope.lsp_document_symbols, 'Show document symbols')
		map('<leader>ds', telescope.lsp_document_symbols, 'Show document symbols')
		map('<leader>gI', telescope.lsp_implementations, 'Implementations')
		map('<leader>D', telescope.lsp_type_definitions, 'Type definitions')
	end,
})
