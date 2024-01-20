local lualine_config = function (_, opts)
  local custroub = {
    winbar = {},
    inactive_winbar = {},
    filetypes = {'Trouble'}
  }

  local extensions = { 'quickfix', custroub }
  vim.list_extend(extensions, vim.tbl_values(opts.extra_extensions))

  require('lualine').setup {
    extensions = extensions,
    options = {
      theme = 'jellybeans',
      globalstatus = true,
    },
    sections = {
      lualine_b = {'branch', 'diff', 'diagnostics'},
      lualine_c = {},
    },
    tabline = {
      lualine_a = {{'buffers', mode=4}},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {}
    },
    winbar = {
      lualine_b = {'navic'},
      lualine_z = {{'filename', path=4}},
    },
    inactive_winbar = {
      lualine_a = {'navic'},
      lualine_z = {{'filename', path=4}},
    },
  }
end

return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      extra_extensions = {},
      --override_lsp_status = nil,
    },
    config = lualine_config,
  },
}
