-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear search highlights when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
-- vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Keybinds for tab navigation
vim.keymap.set("n", "<C-t>n", ":tabnew<CR>", { desc = "Create a new tab" })
vim.keymap.set("n", "<C-t>h", ":tabprev<CR>", { desc = "Move to the left tab" })
vim.keymap.set("n", "<C-t>l", ":tabnext<CR>", { desc = "Move to the right tab" })
vim.keymap.set("n", "<C-t>x", ":tabclose<CR>", { desc = "Close the current tab" })
vim.keymap.set("n", "<C-t>o", ":tabonly<CR>", { desc = "Close the other tabs" })
vim.keymap.set("n", "<C-t>1", ":1tabnext<CR>", { desc = "Go to the first tab" })
vim.keymap.set("n", "<C-t>2", ":2tabnext<CR>", { desc = "Go to the second tab" })
vim.keymap.set("n", "<C-t>3", ":3tabnext<CR>", { desc = "Go to the third tab" })
vim.keymap.set("n", "<C-t>4", ":4tabnext<CR>", { desc = "Go to the fourth tab" })
vim.keymap.set("n", "<C-t>5", ":5tabnext<CR>", { desc = "Go to the fifth tab" })
vim.keymap.set("n", "<C-t><C-h>", "-tabmove", { desc = "Move tab to the left" })
vim.keymap.set("n", "<C-t><C-l>", "+tabmove", { desc = "Move tab to the right" })

vim.keymap.set("n", "<C-w>", ":bdelete<CR>", { desc = "Remove current (unsaved) buffer" })
