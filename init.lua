vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

require("config.lazy")

require("config.options")
require("config.keymaps")
require("config.autocmds")

-- Set colorscheme
-- vim.cmd("colorscheme tokyonight")
