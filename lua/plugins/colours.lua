return {
  {
    "savq/melange-nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("melange")
      vim.api.nvim_set_hl(0, "LspReferenceText", { bg = "#334549", bold = true, underline = true })
    end,
  },
  {"folke/tokyonight.nvim"},
}
