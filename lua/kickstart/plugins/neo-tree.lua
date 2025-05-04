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
      hide_root_node = true,
      follow_current_file = {
        enabled = true, -- This is what you need!
        leave_dirs_open = false, -- Optional: keep parent dirs open
      },
      hijack_netrw_behavior = 'open_current',
      window = {
        mappings = {
          ['\\'] = 'close_window',
          ['<PageUp>'] = 'close_window',
          ['Z'] = 'expand_all_nodes',
          ['l'] = 'open',

          ['<leader>sf'] = function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            local is_directory = node.type == 'directory'

            if not is_directory then
              path = vim.fn.fnamemodify(path, ':h')
            end

            vim.notify('Searching in: ' .. path, vim.log.levels.INFO, { title = 'Neo-tree Grep' })
            require('telescope.builtin').live_grep { search_dirs = { path } }
          end,
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
    close_if_last_window = true,
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
        indent_size = 2,
      },
    },
  },
}
