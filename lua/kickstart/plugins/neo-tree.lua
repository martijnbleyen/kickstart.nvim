-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
    { '<PageUp>', ':Neotree reveal source=git_status<CR>', desc = 'NeoTree git_status reveal', silent = true },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
          ['<PageUp>'] = 'close_window',
          ['Z'] = 'expand_all_nodes',
          ['l'] = 'open',
        },
      },
    },
    git_status = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
          ['<PageUp>'] = 'close_window',
          ['Z'] = 'expand_all_nodes',
        },
      },
    },
    hide_root_node = true,
    close_if_last_window = true,
    follow_current_file = true,
    enable_git_status = true,
    enable_modified_markers = true,
    statusline = {
      enable = false,
    },
    window = {
      width = 50,
    },
    nesting_rules = {
      ['facade-test'] = {
        pattern = '(.+)%.facade.ts$',
        files = { '%1.facade.spec.ts' },
      },
    },
    default_component_configs = {
      indent = {
        with_markers = true,
        indent_marker = '│',
        last_indent_marker = '└',
        indent_size = 1,
      },
    },
  },
}
