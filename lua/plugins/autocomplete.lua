vim.pack.add({
	'https://github.com/hrsh7th/nvim-cmp',
	'https://github.com/L3MON4D3/LuaSnip',
	'https://github.com/onsails/lspkind.nvim',
	'https://github.com/hrsh7th/cmp-buffer',
	'https://github.com/hrsh7th/cmp-path',
	'https://github.com/hrsh7th/cmp-cmdline',
})

local cmp = require('cmp')
local luasnip = require('luasnip')
local lspkind = require('lspkind')

lspkind.init({ mode = 'symbol_text' })
luasnip.config.setup({})

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},

	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},

	-- For an understanding of why these mappings were
	-- chosen, you will need to read `:help ins-completion`
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<CR>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				if luasnip.expandable() then
					luasnip.expand()
				else
					cmp.confirm({ select = true })
				end
			else
				fallback()
			end
		end),

		-- Select prev item
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.locally_jumpable(1) then
				luasnip.jump(1)
			else
				fallback()
			end
		end, { 'i', 's' }),

		-- Select next item
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.locally_jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),

		-- Manually trigger a completion from nvim-cmp.
		['<C-Space>'] = cmp.mapping.complete({}),
		-- <c-l> will move you to the right of each of the expansion locations.
		-- <c-h> is similar, except moving you backwards.
		['<C-l>'] = cmp.mapping(function()
			if luasnip.expand_or_locally_jumpable() then
				luasnip.expand_or_jump()
			end
		end, { 'i', 's' }),
		['<C-h>'] = cmp.mapping(function()
			if luasnip.locally_jumpable(-1) then
				luasnip.jump(-1)
			end
		end, { 'i', 's' }),
	}),

	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip', keyword_length = 2 },
		{ name = 'buffer', keyword_length = 3 },
		{ name = 'path' },
	},
})

cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' },
	},
})

cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path', keyword_length = 3 },
	}, {
		{ name = 'cmdline', keyword_length = 3 },
	}),
	matching = { disallow_symbol_nonprefix_matching = false },
})
