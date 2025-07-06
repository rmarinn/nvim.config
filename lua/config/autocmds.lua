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

-- zig mappings
vim.api.nvim_create_autocmd("filetype", {
	desc = "zig mappings",
	group = vim.api.nvim_create_augroup("zig_mappings", { clear = true }),
	pattern = "zig",
	callback = function(_)
		vim.keymap.set("n", "<F3>", ":!zig run ")
		vim.keymap.set("n", "<F4>", ":!zig build test<CR>")
		vim.keymap.set("n", "<F5>", ":!zig build run<CR>")
	end,
})

-- go mappings
vim.api.nvim_create_autocmd("filetype", {
	desc = "go mappings",
	group = vim.api.nvim_create_augroup("go_mappings", { clear = true }),
	pattern = "go",
	callback = function(_)
		vim.keymap.set("n", "<F1>", function()
			-- Get full path to current file
			local file = vim.fn.expand("%")

			-- Use ripgrep to extract the package name
			local pkgname = ""
			local handle = io.popen("rg '^package ' " .. file .. " | awk '{print $2}'")
			if handle then
				pkgname = handle:read("*l")
				handle:close()
			end

			if pkgname == "" then
				print("Could not find package name in " .. file)
				return
			end

			-- Build the Go file into a named binary (e.g., ./main)
			local build_cmd = string.format("go build -o %s %s", pkgname, file)
			local build_result = os.execute(build_cmd)
			if build_result ~= 0 then
				print("Go build failed")
				return
			end


			-- Dump assembly from user-defined functions only
			local asm_filename = "/tmp/" .. pkgname .. "_asm.s"
			local asm_cmd      = string.format(
				"go tool objdump -s '^%s' ./%s | expand -t 2 > %s",
				pkgname, pkgname, asm_filename)
			local ok           = os.execute(asm_cmd)
			if not ok then
				local err_msg = string.format("Failed to disassemble code:\n%s", asm_cmd)
				vim.notify(err_msg, vim.log.levels.ERROR)
			end

			-- Open the output file in a vertical split
			vim.cmd("vsplit " .. asm_filename)
		end, { noremap = true, silent = false })
		vim.keymap.set("n", "<F3>", ":!go run . -race<CR>")
		vim.keymap.set("n", "<F5>", ":!go run .<CR>")
		vim.keymap.set("n", "<F4>", ":!go test .<CR>")
	end,
})
