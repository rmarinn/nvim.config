vim.pack.add({
	'https://github.com/stevearc/conform.nvim',
})

local conform = require('conform')
conform.setup({
	default_format_opts = { lsp_format = 'fallback' },
})

conform.formatters_by_ft.lua = { 'stylua' }
conform.formatters_by_ft.zig = { 'zigfmt' }
conform.formatters_by_ft.rust = { 'rustfmt' }
conform.formatters_by_ft.json = { 'prettierd' }
conform.formatters_by_ft.python = { 'black' }

conform.formatters.stylua = {
	append_args = { '--quote-style', 'AutoPreferSingle' },
}

vim.keymap.set('n', '<leader>f', function()
	conform.format({ async = true, lsp_format = 'fallback' })
end, { desc = 'Format current buffer' })
