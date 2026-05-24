-- ~/.config/nvim/lua/plugins/telescope.lua
return {
  "nvim-telescope/telescope.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        path_display = { "truncate" },
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = { prompt_position = "top" },
        },
      },
    })
    telescope.load_extension("fzf")

    -- Raccourcis Telescope
    local map = vim.keymap.set
    map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Chercher un fichier" })
    map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Chercher du texte" })
    map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Lister les buffers" })
    map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Chercher dans l'aide" })
    map("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", { desc = "Fichiers récents" })
    map("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>", { desc = "Diagnostics LSP" })
  end,
}
