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


--[[
-- python mappings
vim.api.nvim_create_autocmd("FileType", {
	desc = "python mappings",
	group = vim.api.nvim_create_augroup("python_mappings", { clear = true }),
	pattern = "python",
	callback = function(_)
		vim.keymap.set("n", "<F4>", ":w <bar> exec '!python '.shellescape('%')<CR>")
	end,
})

-- lua mappings
vim.api.nvim_create_autocmd("FileType", {
	desc = "lua mappings",
	group = vim.api.nvim_create_augroup("lua_mappings", { clear = true }),
	pattern = "lua",
	callback = function(_)
		vim.keymap.set("n", "<F4>", function()
			vim.cmd("source %")
		end)
	end,
})
--]]
