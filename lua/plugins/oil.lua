vim.pack.add({
	'https://github.com/stevearc/oil.nvim',
})

require('oil').setup({
	default_file_explorer = true,
	columns = { 'icon' },
	buf_options = {
		buflisted = false,
		bufhidden = 'hide',
	},
	delete_to_trash = false,
	skip_confirm_for_simple_edits = true,
	prompt_save_on_select_new_entry = true,
	cleanup_delay_ms = 2000,
	lsp_file_methods = {
		enabled = true,
		timeout_ms = 1000,
		autosave_changes = true,
	},
	constrain_cursor = 'editable',
	watch_for_changes = true,
	keymaps = {
		['g?'] = { 'actions.show_help', mode = 'n' },
		['<CR>'] = 'actions.select',
		['<C-s>'] = { 'actions.select', opts = { vertical = true } },
		['<C-h>'] = { 'actions.select', opts = { horizontal = true } },
		['<C-t>'] = { 'actions.select', opts = { tab = true } },
		['<C-p>'] = 'actions.preview',
		['<C-c>'] = { 'actions.close', mode = 'n' },
		['<C-l>'] = 'actions.refresh',
		['-'] = { 'actions.parent', mode = 'n' },
		['_'] = { 'actions.open_cwd', mode = 'n' },
		['`'] = { 'actions.cd', mode = 'n' },
		['g~'] = { 'actions.cd', opts = { scope = 'tab' }, mode = 'n' },
		['gs'] = { 'actions.change_sort', mode = 'n' },
		['gx'] = 'actions.open_external',
		['g.'] = { 'actions.toggle_hidden', mode = 'n' },
		['g\\'] = { 'actions.toggle_trash', mode = 'n' },
	},
	use_default_keymaps = true,
})
