return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function ()
      local configs = require('nvim-treesitter.configs')

      configs.setup({
        ensure_installed = { 'c', 'cpp', 'python', 'go', 'rust', 'starlark', 'lua', 'vim', 'vimdoc', 'query', 'javascript', 'html', 'yaml', 'json', 'caddy' },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = false },
      })
    end,
  },
  {
    'hiphish/rainbow-delimiters.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function ()
      local rainbow_delimiters = require 'rainbow-delimiters'
      vim.g.rainbow_delimiters = {
        strategy = {
          [''] = rainbow_delimiters.strategy['global'],
          vim = rainbow_delimiters.strategy['local'],
        },
        query = {
          [''] = 'rainbow-delimiters',
          lua = 'rainbow-blocks',
        },
      }
    end,
  },
}
