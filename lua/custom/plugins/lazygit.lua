return {
  'kdheepak/lazygit.nvim',
  cmd = 'LazyGit',
  keys = {
    { '<leader><leader>g', '<cmd>LazyGit<cr>', desc = 'Open LazyGit' },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
}
