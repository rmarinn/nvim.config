return {
	-- debugger
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
		"theHamsta/nvim-dap-virtual-text",
		"folke/lazydev.nvim",
	},
	config = function()
		require("lazydev").setup({
			library = { "nvim-dap-ui" },
		})

		local dap = require("dap")
		local dapui = require("dapui")
		require("dapui").setup()

		local codelldb = vim.fn.stdpath("data") .. "/mason/bin/codelldb.cmd"
		dap.adapters.codelldb = function(callback, config)
			if config.request == "attach" then
				callback({
					type = "server",
					host = config.host or "127.0.0.1",
					port = config.port or "38698",
				})
			else
				callback({
					type = "server",
					port = "${port}",
					executable = {
						command = codelldb,
						args = { "--port", "${port}" },
					},
				})
			end
		end

		dap.configurations.rust = {
			{
				name = "Debug Rust executable",
				type = "codelldb",
				request = "launch",
				program = function()
					local workspace_folder = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
					return vim.fn.input(
						"Path to executable: ",
						vim.fn.getcwd() .. "/target/debug/" .. workspace_folder .. ".exe",
						"file"
					)
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				args = {},
			},
		}

		dap.configurations.zig = {
			{
				type = "codelldb",
				-- command = codelldb,
				name = "Debug Zig executable",
				task = "zig build",
				request = "launch",
				cwd = "${workspaceFolder}",
				program = function()
					vim.fn.jobstart("zig build", {
						stdout_buffered = true,
						stderr_buffered = true,
						on_exit = function() end,
					})

					local folder = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
					return vim.fn.getcwd() .. "/zig-out/bin/" .. folder .. ".exe"
				end,
				args = {},
			},
		}
		-- dap.configurations.zig = {
		-- 	{
		-- 		name = "Debug Zig executable",
		-- 		type = "codelldb",
		-- 		request = "launch",
		-- 		program = function()
		-- 			local workspace_folder = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
		-- 			return vim.fn.input(
		-- 				"Path to executable: ",
		-- 				vim.fn.getcwd() .. "\\zig-out\\bin\\" .. workspace_folder .. ".exe",
		-- 				"file"
		-- 			)
		-- 		end,
		-- 		cwd = "${workspaceFolder}",
		-- 		stopOnEntry = false,
		-- 		args = {},
		-- 	},
		-- }

		dap.adapters.delve = function(callback, config)
			if config.mode == "remote" and config.request == "attach" then
				callback({
					type = "server",
					host = config.host or "127.0.0.1",
					port = config.port or "38697",
				})
			else
				callback({
					type = "server",
					port = "${port}",
					executable = {
						command = "dlv.cmd",
						args = { "dap", "-l", "127.0.0.1:${port}", "--log", "--log-output=dap" },
						detached = vim.fn.has("win32") == 0,
					},
				})
			end
		end

		dap.configurations.go = {
			{
				type = "delve",
				name = "Debug (go.mod)",
				request = "launch",
				program = "./${relativeFileDirname}",
			},
			{
				type = "delve",
				name = "Debug",
				request = "launch",
				program = "${file}",
			},
			{
				type = "delve",
				name = "Debug test",
				request = "launch",
				mode = "test",
				program = "${file}",
			},
			{
				type = "delve",
				name = "Debug test (go.mod)",
				request = "launch",
				mode = "test",
				program = "./${relativeFileDirname}",
			},
		}

		vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "DAP Toggle Breakpoint" })
		vim.keymap.set("n", "<leader>dx", dap.terminate, { desc = "DAP Terminate" })
		vim.keymap.set("n", "<leader>dh", dap.step_back, { desc = "DAP Step Back" })
		vim.keymap.set("n", "<leader>dk", dap.step_into, { desc = "DAP Step Into" })
		vim.keymap.set("n", "<leader>dj", dap.step_over, { desc = "DAP Step Over" })
		vim.keymap.set("n", "<leader>dl", dap.step_out, { desc = "DAP Step Out" })
		vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "DAP Start or Continue" })
		vim.keymap.set("n", "<leader>gb", dap.run_to_cursor, { desc = "DAP Run to cursor" })
		vim.keymap.set("n", "<leader><leader>dc", dap.run_last, { desc = "DAP Run last" })
		vim.keymap.set("n", "<leader><leader>dr;", dap.restart, { desc = "DAP Restart" })
		vim.keymap.set("n", "<leader>?", function()
			dapui.eval(nil, { enter = true })
		end, { desc = "DAP Start or Continue" })

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
	end,
}
