local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets('zig', {
	s('calloc', {
		t('const Allocator = std.mem.Allocator;'),
		i(1),
	}),
})
