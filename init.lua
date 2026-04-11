vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 500
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.hlsearch = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.guifont = 'Mononoki Nerd Font Mono'
vim.opt.fileformats = { 'unix', 'dos' }

vim.cmd.packadd('nohlsearch')
vim.cmd.packadd('nvim.difftool')

vim.pack.add({ 'https://github.com/neovim/nvim-lspconfig' })
vim.lsp.enable('lua_ls')
vim.lsp.enable('zls')
vim.lsp.enable('rust_analyzer')
vim.lsp.enable('basedpyright')

require('plugins.conform')
require('plugins.fugitive')
require('plugins.harpoon')
require('plugins.lualine')
require('plugins.oil')
require('plugins.telescope')
require('plugins.treesitter')
require('plugins.undotree')

require('keymaps')
require('autocmds')
require('colorscheme')

-- vim.g.clipboard = {
-- 	name = "WslClipboard",
-- 	copy = {
-- 		["+"] = "clip.exe",
-- 		["*"] = "clip.exe",
-- 	},
-- 	paste = {
-- 		["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
-- 		["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
-- 	},
-- 	cache_enabled = 0,
-- }
