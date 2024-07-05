-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- python mappings
vim.api.nvim_create_autocmd("FileType", {
	desc = "python mappings",
	group = vim.api.nvim_create_augroup("py_mapping", { clear = true }),
	pattern = "python",
	callback = function(_)
		vim.keymap.set("n", "<F4>", ":w <bar> exec '!python '.shellescape('%')<CR>")
	end,
})
