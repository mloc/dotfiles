return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      lsp_handlers_hooks = {
        dm = function()
          local lspconfig = require 'lspconfig'
          local configs = require 'lspconfig.configs'

          if not configs.spacemandmm then
            configs.spacemandmm = {
              default_config = {
                cmd = {'dm-langserver'},
                filetypes = {'dm'},
                root_dir = function(fname)
                  return lspconfig.util.find_git_ancestor(fname)
                end,
                settings = {},
              },
            }
          end
        end,
      },
      configs = {
        spacemandmm = {},
      },
    },
  },
}
