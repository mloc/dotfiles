local telescope_config = function (_, opts)
  local telescope = require("telescope")
  local actions = require("telescope.actions")
  local open_with_trouble = require("trouble.sources.telescope").open
  telescope.setup {
    defaults = {
      path_display = function(popts, path)
        for _, f in pairs(opts.path_handlers) do
          path = f(popts, path)
        end
        return path
      end,
    },
    pickers = {
      buffers = {
        mappings = {
          i = {
            ["<c-]>"] = actions.delete_buffer + actions.move_to_top,
            ["<c-t>"] = open_with_trouble,
          },
          n = {
            ["<c-]>"] = actions.delete_buffer + actions.move_to_top,
            ["<c-t>"] = open_with_trouble,
          },
        },
      },
    },
    extensions = {
      ["ui-select"] = {
        require("telescope.themes").get_dropdown {}
      },
    },
  }
  telescope.load_extension("file_browser")
  telescope.load_extension("ui-select")
  telescope.load_extension("ui-select")
  telescope.load_extension("egrepify")
end

return {
  {
    "nvim-telescope/telescope.nvim", branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      "folke/trouble.nvim",
      "fdschmidt93/telescope-egrepify.nvim",
    },
    opts = {
      path_handlers = {},
    },
    config = telescope_config,
    keys = {
      {"<leader>o", "<cmd>Telescope buffers<cr>"},
      {"<leader>n", "<cmd>Telescope file_browser<cr>"},
      {"<c-p>", "<cmd>Telescope find_files<cr>"},
      {"<c-f>", "<cmd>Telescope egrepify<cr>"},
      {"<c-h>", "<cmd>Telescope diagnostics<cr>"},
      {"<leader><c-n>", "<cmd>Telescope file_browser path=%:p:h<cr>"},
      {"<leader><c-p>", "<cmd>Telescope find_files cwd=%:p:h<cr>"},
      {"<leader><c-f>", "<cmd>Telescope egrepify cwd=%:p:h<cr>"},
    },
  },
}
