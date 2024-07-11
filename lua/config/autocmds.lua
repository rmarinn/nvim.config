local augroup = vim.api.nvim_create_augroup("my-custom-aug", { clear = true })

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = augroup,
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("BufWritePre", {
	desc = "Format buffer before saving saving",
	group = augroup,
	callback = function()
		require("conform").format({ async = true, lsp_fallback = true })
	end,
})

-- python mappings
vim.api.nvim_create_autocmd("FileType", {
	desc = "python mappings",
	group = vim.api.nvim_create_augroup("python_mappings", { clear = true }),
	pattern = "python",
	callback = function(_)
		vim.keymap.set("n", "<F5>", ":w <bar> exec '!python '.shellescape('%')<CR>") -- save then run current python file
	end,
})

-- lua mappings
vim.api.nvim_create_autocmd("filetype", {
	desc = "lua mappings",
	group = vim.api.nvim_create_augroup("lua_mappings", { clear = true }),
	pattern = "lua",
	callback = function(_)
		vim.keymap.set("n", "<F5>", function()
			vim.cmd("source %") -- run current lua file
		end)
	end,
})

-- rust mappings
vim.api.nvim_create_autocmd("filetype", {
	desc = "rust mappings",
	group = vim.api.nvim_create_augroup("rust_mappings", { clear = true }),
	pattern = "rust",
	callback = function(_)
		vim.keymap.set("n", "<F4>", ":w <bar> exec '!cargo check'<CR>") -- save then check if current project can compile
		vim.keymap.set("n", "<F5>", ":w <bar> exec '!cargo run'<CR>") -- save then compile current project
		vim.keymap.set("n", "<F6>", ":exec '!cargo test'<CR>") -- run tests for current project
	end,
})
