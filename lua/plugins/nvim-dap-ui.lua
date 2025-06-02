return {
	-- debugger
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
		"folke/lazydev.nvim",
		"https://github.com/leoluz/nvim-dap-go",
	},
	config = function()
		require("lazydev").setup({
			library = { "nvim-dap-ui" },
		})

		local dap, dapui = require("dap"), require("dapui")
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

		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			executable = {
				command = vim.fn.stdpath("data") .. "/mason/bin/codelldb.cmd",
				args = { "--port", "${port}" },
			},
		}

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

		require("dap-go").setup({
			dap_configurations = {
				{
					type = "go",
					name = "Attach remote",
					mode = "remote",
					request = "attach",
				},
			},
			delve = {
				path = "dlv.cmd",
				initialize_timeout_sec = 20,
				port = "${port}",
				args = {},
				build_flags = {},
				detached = vim.fn.has("win32") == 0,
				cwd = nil,
			},
			tests = {
				verbose = false,
			},
		})

		vim.keymap.set(
			"n",
			"<leader>dt",
			":lua require'dap'.toggle_breakpoint()<CR>",
			{ desc = "DAP Toggle Breakpoint" }
		)
		vim.keymap.set("n", "<leader>dx", ":lua require'dap'.terminate()<CR>", { desc = "DAP Terminate" })
		vim.keymap.set("n", "<leader>dl", ":lua require'dap'.step_over()<CR>", { desc = "DAP Step Over" })
		vim.keymap.set("n", "<leader>dk", ":lua require'dap'.step_into()<CR>", { desc = "DAP Step Into" })
		vim.keymap.set("n", "<leader>dj", ":lua require'dap'.step_out()<CR>", { desc = "DAP Step Out" })
		vim.keymap.set("n", "<leader>dc", ":lua require'dap'.continue()<CR>", { desc = "DAP Start or Continue" })
		vim.keymap.set("n", "<leader><leader>dc", ":lua require'dap'.run_last()<CR>", { desc = "DAP Run last" })
		vim.keymap.set("n", "<leader><leader>dr;", ":lua require'dap'.restart()<CR>", { desc = "DAP Restart" })

		dapui.setup()
	end,
}
