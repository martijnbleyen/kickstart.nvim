local function open_floating_term(cmd)
  local buf = vim.api.nvim_create_buf(false, true)
  local width = math.floor(vim.o.columns * 0.5)
  local height = math.floor(vim.o.lines * 0.5)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    style = 'minimal',
    border = 'rounded',
  })

  vim.fn.termopen(cmd)
  vim.cmd 'startinsert'
end

vim.api.nvim_create_user_command('PRStatus', function()
  open_floating_term '~/code/gh-pr-checker/pr-status'
end, {})

vim.keymap.set('n', '<leader>pr', ':PRStatus<CR>', { desc = 'GitHub PR Status' })

return {}
