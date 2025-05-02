-- Buffer management
vim.keymap.set('n', '<leader>c', ':bd<CR>', { desc = '[C]lose tab', silent = true })
vim.keymap.set('n', '<leader>bo', [[:%bd|e#|bd#<CR>]], { desc = '[C]lose all [O]ther buffers', silent = true })

-- Diffview
-- vim.keymap.set('n', '<PageUp>', [[:DiffviewOpen<CR>]], { desc = 'Open Diffview', silent = true })
local function toggle_diffview()
  local view = require('diffview.lib').get_current_view()
  if view then
    -- Diffview is open, close it
    vim.cmd 'DiffviewClose'
  else
    -- Diffview is not open, open it
    vim.cmd 'DiffviewOpen'
  end
end

vim.keymap.set('n', '<leader>g', toggle_diffview, { desc = 'Toggle Diffview', silent = true })

-- Neotree
vim.keymap.set('n', '<leader>e', [[:Neotree toggle<CR>]], { desc = 'Toggle Neotree', silent = true })

return {}
