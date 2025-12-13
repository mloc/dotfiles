return {
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    cmd = "Trouble",
    keys = {
      {"<leader>xx", "<cmd>Trouble toggle<cr>"},
      {"<leader>xc", "<cmd>Trouble close<cr>"},
      {"<leader>xd", "<cmd>Trouble toggle diagnostics<cr>"},
      {"<leader>xq", "<cmd>Trouble toggle quickfix<cr>"},
      {"<leader>xl", "<cmd>Trouble toggle loclist<cr>"},
    },
  }
}
