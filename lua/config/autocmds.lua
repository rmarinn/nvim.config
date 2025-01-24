local augroup = vim.api.nvim_create_augroup("my-custom-aug", { clear = true })

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = augroup,
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Format buffer before saving
-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	desc = "Format buffer before saving saving",
-- 	group = augroup,
-- 	callback = function()
-- 		require("conform").format({ async = true, lsp_fallback = true })
-- 	end,
-- })

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
		vim.keymap.set("n", "<F2>", ":Cargo clippy -- -Dwarnings<CR>")
		vim.keymap.set("n", "<F3>", ":Cargo check<CR>")
		vim.keymap.set("n", "<F4>", ":Cargo test<CR>")
		vim.keymap.set("n", "<F5>", ":Cargo run<CR>")
	end,
})

-- go mappings
vim.api.nvim_create_autocmd("filetype", {
	desc = "go mappings",
	group = vim.api.nvim_create_augroup("go_mappings", { clear = true }),
	pattern = "go",
	callback = function(_)
		vim.keymap.set("n", "<F2>", ":!go mod clean<CR>")
		vim.keymap.set("n", "<F3>", ":!go mod tidy<CR>")
		vim.keymap.set("n", "<F4>", ":!go test<CR>")
		vim.keymap.set("n", "<F5>", ":!go run .<CR>")
	end,
})
