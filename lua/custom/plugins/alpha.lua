-- Set up alpha.nvim as the first page
vim.api.nvim_create_autocmd('VimEnter', {
  pattern = '*',
  callback = function()
    if not vim.fn.argc() then
      require('alpha').start()
    end
  end,
})

return {
  'goolord/alpha-nvim',
  config = function()
    -- Dashboard theme config
    local dashboard = require 'alpha.themes.dashboard'
    require('alpha').setup(dashboard.config)
  end,
}
