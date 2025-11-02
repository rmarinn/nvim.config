vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.g.have_nerd_font = true

-- "C:\\Program Files\\Git\\usr\\bin\\bash.exe", args = ["--login", "-i"]
-- For using vim with bash on windows
vim.o.shell = vim.fn.shellescape("C:\\Program Files\\Git\\usr\\bin\\bash.exe")
vim.o.shellcmdflag = "-c"
vim.o.shellquote = ""
vim.o.shellxquote = ""

require("config.keymaps")
require("config.options")
require("config.autocmds")
require("config.lazy")
