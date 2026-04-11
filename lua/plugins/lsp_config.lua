vim.pack.add({ 'https://github.com/neovim/nvim-lspconfig' })

local function lazy_init(pat, lsp)
	vim.api.nvim_create_autocmd('FileType', {
		pattern = pat,
		callback = function()
			vim.lsp.enable(lsp)
		end,
	})
end

lazy_init('lua', 'lua_ls')
lazy_init('zig', 'zls')
lazy_init('rust', 'rust_analyzer')
lazy_init('python', 'basedpyright')

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
	end,
})
