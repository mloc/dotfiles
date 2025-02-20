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

    if client.server_capabilities.documentHighlightProvider then
      local lspgroup = vim.api.nvim_create_augroup("LSP", { clear = true })
      vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI"}, {
        pattern = "<buffer>",
        group = lspgroup,
        callback = function(info)
          vim.lsp.buf.document_highlight(info.buf)
        end
      })
      vim.api.nvim_create_autocmd({"CursorMoved"}, {
        pattern = "<buffer>",
        group = lspgroup,
        callback = function(info)
          vim.lsp.util.buf_clear_references(info.buf)
        end
      })
    end

    --[[
    vim.api.nvim_command("augroup LSP")
    vim.api.nvim_command("autocmd!")
    if client.server_capabilities.documentHighlightProvider then
      vim.api.nvim_command("autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()")
      vim.api.nvim_command("autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()")
      vim.api.nvim_command("autocmd CursorMoved <buffer> lua vim.lsp.util.buf_clear_references()")
    end
    vim.api.nvim_command("augroup END")
    --]]
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
      {"g0", "<cmd>lua vim.lsp.buf.document_symbol()<CR>"},
      {"gW", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>"},
      {"gd", "<cmd>Trouble lsp_definitions auto_refresh=false<CR>"},
      {"gD", "<cmd>lua vim.lsp.buf.declaration()<CR>"},
      {"gi", "<cmd>lua vim.lsp.buf.implementation()<CR>"},
      {"gr", "<cmd>Trouble lsp_references auto_refresh=false<cr>"},
      {"<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>"},
      {"gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>"},
      {"[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>"},
      {"]d", "<cmd>lua vim.diagnostic.goto_next()<CR>"},
    },
    opts = {
      configs = {},
      on_attach_hooks = {
        navic = function(c, b)
          local navic = require("nvim-navic")
          navic.attach(c, b)
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
}
