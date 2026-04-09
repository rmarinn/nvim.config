local set = function(mode, lhs, rhs, opts)
	vim.keymap.set(mode, lhs, rhs, opts)
end

-- Navigation
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
set('n', '<leader>qj', ':cnext<CR>', { desc = 'Move to next item in the quickfix list' })
set('n', '<leader>qk', ':cprev<CR>', { desc = 'Move to previous item in the quickfix list' })

-- Split
set('n', '<leader>sh', ':vsp<CR><C-w><C-h>', { desc = 'Split leftwards' })
set('n', '<leader>sl', ':vsp<CR><C-w><C-l>', { desc = 'Split rightwards' })
set('n', '<leader>sk', ':sp<CR><C-w><C-k>', { desc = 'Split upwards' })
set('n', '<leader>sj', ':sp<CR><C-w><C-j>', { desc = 'Split downwards' })

-- Terminal
set('n', '<leader>tt', ':term<CR>', { desc = 'Open terminal on the current buffer' })
set('n', '<leader>th', ':vsp<CR><C-w><C-h>:term<CR>', { desc = 'Split terminal leftwards' })
set('n', '<leader>tl', ':vsp<CR><C-w><C-l>:term<CR>', { desc = 'Split terminal rightwards' })
set('n', '<leader>tk', ':sp<CR><C-w><C-k>:term<CR>', { desc = 'Split terminal upwards' })
set('n', '<leader>tj', ':sp<CR><C-w><C-j>:term<CR>', { desc = 'Split terminal downwards' })

-- Filesystem
set('n', '<C-n>', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
