return {
	"neovim/nvim-lspconfig",
	version = "v2.3.*",
	dependencies = {
		{ "mason-org/mason.nvim" },
		{ "mason-org/mason-lspconfig.nvim" },
		{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
		{ "j-hui/fidget.nvim", opts = {}, version = "v1.6.\\d+$" },
		{
			"nvim-telescope/telescope.nvim",
			version = "v0.1.\\d+$",
		},
		{ "hrsh7th/nvim-cmp", version = "v0.0.\\d+$" },
		{ "hrsh7th/cmp-nvim-lsp" },
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),

			callback = function(event)
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
				map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
				map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
				map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
				map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
				map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
				map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
				map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
				map("K", vim.lsp.buf.hover, "Hover Documentation")
				map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

				vim.api.nvim_create_autocmd("BufWritePost", {
					pattern = { "*.sql" },
					callback = function()
						vim.fn.system("sqlc generate")
						-- notify gopls to refresh workspace
						for _, client in pairs(vim.lsp.get_clients()) do
							if client.name == "gopls" then
								client.notify("workspace/didChangeWatchedFiles", {
									changes = {
										-- type = 3 means changed
										{ uri = vim.uri_from_fname(vim.fn.getcwd()), type = 3 },
									},
								})
							end
						end
					end,
				})

				-- The following two autocommands are used to highlight references of the
				-- word under your cursor when your cursor rests there for a little while.
				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.server_capabilities.documentHighlightProvider then
					local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })

					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.document_highlight,
					})

					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.clear_references,
					})

					vim.api.nvim_create_autocmd("LspDetach", {
						group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
						callback = function(event2)
							vim.lsp.buf.clear_references()
							vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
						end,
					})
				end
			end,
		})

		-- LSP servers and clients are able to communicate to each other what features they support.
		--  By default, Neovim doesn't support everything that is in the LSP specification.
		--  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
		--  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		vim.lsp.config("lua_ls", {
			cmd = { "lua-language-server" },
			capabilities = capabilities,
		})

		vim.lsp.config("stylua", {
			capabilities = capabilities,
		})

		vim.lsp.config("rust_analyzer", {
			settings = {
				["rust-analyzer"] = {
					cargo = {
						-- features = "all",
						-- buildScripts = { enable = true },
						-- procMacro = { enable = true },
						targetDir = true,
					},
					check = {
						workspace = false,
					},
				},
			},
		})

		vim.lsp.config("gopls", {
			capabilities = capabilities,
		})

		vim.lsp.config("html", {
			capabilities = capabilities,
			file_types = { "html", "templ" },
		})

		vim.lsp.config("emmet_language_server", {
			capabilities = capabilities,
			file_types = { "html", "templ" },
		})

		vim.lsp.config("zls", {
			capabilities = capabilities,
			settings = {
				enable_build_on_save = true,
				build_on_save_step = "check",
			},
		})

		require("mason").setup()
		require("mason-lspconfig").setup({
			automatic_enable = true,
		})

		require("mason-tool-installer").setup({
			ensure_installed = {
				"lua_ls",
				"stylua",
				"rust_analyzer",
				"gopls",
			},
		})
	end,
}
