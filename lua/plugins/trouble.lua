return {
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    cmd = "Trouble",
    keys = {
      {"<leader>xx", "<cmd>TroubleToggle<cr>"},
      {"<leader>xc", "<cmd>TroubleClose<cr>"},
      {"<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>"},
      {"<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>"},
      {"<leader>xq", "<cmd>TroubleToggle quickfix<cr>"},
      {"<leader>xl", "<cmd>TroubleToggle loclist<cr>"},
      {"gR", "<cmd>Trouble lsp_references<cr>"},
    },
  }
}
