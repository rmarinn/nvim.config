vim.pack.add({ 'https://github.com/tpope/vim-fugitive' })

vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
vim.keymap.set('n', '<leader>gl', ':Git log --oneline<CR>')
