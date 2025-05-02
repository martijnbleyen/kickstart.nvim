-- Buffer management
vim.keymap.set('n', '<leader>c', ':bd<CR>', { desc = '[C]lose tab', silent = true })
vim.keymap.set('n', '<leader>bo', [[:%bd|e#|bd#<CR>]], { desc = '[C]lose all [O]ther buffers', silent = true })

return {}
