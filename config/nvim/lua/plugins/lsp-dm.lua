return {
  {
    dir = "~/devel/vim-devel/vimdm",
    dev = true,
    lazy = false,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      configs = {
        spacemandmm = {
          cmd = {'dm-langserver'},
          filetypes = {'dm'},
          root_dir = function(buf, on_dir)
            local buf_path = vim.api.nvim_buf_get_name(buf)
            local root = vim.fs.dirname(vim.fs.find({'.git', '.jj'}, { path = buf_path, upward = true })[1])
            if root == nil then
              local dme_match = function(name, path)
                return vim.endswith(name, '.dme')
              end
              root = vim.fs.dirname(vim.fs.find(dme_match, { path = buf_path, upward = true })[1])
            end
            if root == nil then
              root = vim.fs.normalize(vim.fs.abspath(vim.fs.dirname(buf_path)))
            end
            on_dir(root)
          end,
          settings = {},
        },
      },
    },
  },
}
