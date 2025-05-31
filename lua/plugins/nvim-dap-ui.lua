return {
	-- debugger
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
		"folke/lazydev.nvim",
	},
	config = function()
		require("lazydev").setup({
			library = { "nvim-dap-ui" },
		})

		require("dapui").setup()

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

		vim.keymap.set("n", "<leader>dt", ":DapToggleBreakpoint<CR>", { desc = "Dap Toggle Breakpoint" })
		vim.keymap.set("n", "<leader>dx", ":DapTerminate<CR>", { desc = "Dap Terminate" })
		vim.keymap.set("n", "<leader>dl", ":DapStepOver<CR>", { desc = "Dap Step Over" })
		vim.keymap.set("n", "<leader>dk", ":DapStepInto<CR>", { desc = "Dap Step Into" })
		vim.keymap.set("n", "<leader>dh", ":DapStepOut<CR>", { desc = "Dap Step Out" })
		vim.keymap.set("n", "<leader>dc", ":DapContinue<CR>", { desc = "Dap Start or Continue" })

		local dap = require("dap")
		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			executable = {
				-- if installed via Mason
				command = vim.fn.stdpath("data") .. "/mason/bin/codelldb.cmd",
				args = { "--port", "${port}" },
			},
		}

		dap.configurations.rust = {
			{
				name = "Debug executable",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				args = {},
			},
		}
	end,
}
