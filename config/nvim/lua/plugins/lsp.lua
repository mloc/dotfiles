local function lsp_config(_, opts)
  local nvim_lsp = require("lspconfig")
  local configs = require("lspconfig.configs")

  local capabilities = {}
  for _, f in pairs(opts.capabilities_hooks) do
    f(capabilities)
  end

  local on_attach = function(client, bufnr)
    for _, f in pairs(opts.on_attach_hooks) do
      f(client, bufnr)
    end

    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    if vim.lsp.formatexpr then -- Neovim v0.6.0+ only.
      vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr")
    end
    if vim.lsp.tagfunc then
      vim.api.nvim_buf_set_option(bufnr, "tagfunc", "v:lua.vim.lsp.tagfunc")
    end
  end

  for _, f in pairs(opts.lsp_handlers_hooks) do
    f()
  end

  for k, c in pairs(opts.configs) do
    local setup_opts = {
      capabilities = capabilities,
      on_attach = on_attach,
      handlers = handlers,
    }
    for k, v in pairs(c) do
      setup_opts[k] = v
    end
    vim.lsp.config(k, setup_opts)
    vim.lsp.enable(k)
  end
end

return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "SmiteshP/nvim-navic",
      "onsails/lspkind.nvim",
      "folke/trouble.nvim",
      "folke/neoconf.nvim",
    },
    config = lsp_config,
    keys = {
      {"<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>"},
      {"<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>"},
      {"K", "<cmd>lua vim.lsp.buf.hover()<CR>"},
      {"g0", "<cmd>Trouble lsp_document_symbols auto_refresh=false<CR>"},
      {"gW", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>"},
      {"gd", "<cmd>Trouble lsp_definitions auto_refresh=false<CR>"},
      {"gD", "<cmd>Trouble lsp_declarations auto_refresh=false<CR>"},
      {"gi", "<cmd>Trouble lsp_implementations auto_refresh=false<CR>"},
      {"gr", "<cmd>Trouble lsp_references auto_refresh=false<cr>"},
      {"<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>"},
      {"gt", "<cmd>Trouble lsp_type_definitions auto_refresh=false<CR>"},
      {"[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>"},
      {"]d", "<cmd>lua vim.diagnostic.goto_next()<CR>"},
    },
    opts = {
      configs = {
        pylsp = {},
        gopls = {},
        buck2 = {},
        nixd = {},
      },
      on_attach_hooks = {
        navic = function(c, b)
          if c:supports_method('textDocument/documentSymbol') then
            local navic = require("nvim-navic")
            navic.attach(c, b)
          end
        end,
      },
      lsp_handlers_hooks = {},
      capabilities_hooks = {},
    },
  },
  {
    "folke/neoconf.nvim",
    lazy = false,
    config = function(_, _)
      require("neoconf").setup({})
    end,
  },
  {
    "RRethy/vim-illuminate",
    lazy = false,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      configs = {
        lua_ls = {
          on_init = function(client)
            if client.workspace_folders then
              local path = client.workspace_folders[1].name
              if
                path ~= vim.fn.stdpath('config')
                and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
              then
                return
              end
            end

            client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
              runtime = {
                -- Tell the language server which version of Lua you're using (most
                -- likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Tell the language server how to find Lua modules same way as Neovim
                -- (see `:h lua-module-load`)
                path = {
                  'lua/?.lua',
                  'lua/?/init.lua',
                },
              },
              -- Make the server aware of Neovim runtime files
              workspace = {
                checkThirdParty = false,
                library = {
                  vim.env.VIMRUNTIME,
                  '${3rd}/luv/library',
                  '${3rd}/busted/library',
                }
                -- Or pull in all of 'runtimepath'.
                -- NOTE: this is a lot slower and will cause issues when working on
                -- your own configuration.
                -- See https://github.com/neovim/nvim-lspconfig/issues/3189
                -- library = {
                --   vim.api.nvim_get_runtime_file('', true),
                -- }
              }
            })
          end,
          settings = {
            Lua = {}
          },
        },
      },
    },
  },
}
