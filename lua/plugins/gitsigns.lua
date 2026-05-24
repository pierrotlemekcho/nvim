-- ~/.config/nvim/lua/plugins/gitsigns.lua
return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      signs = {
        add          = { text = "│" },
        change       = { text = "│" },
        delete       = { text = "_" },
        topdelete    = { text = "‾" },
        changedelete = { text = "~" },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local map = function(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
        end

        map("n", "]c", gs.next_hunk, "Hunk Git suivant")
        map("n", "[c", gs.prev_hunk, "Hunk Git précédent")
        map("n", "<leader>gp", gs.preview_hunk, "Prévisualiser le changement")
        map("n", "<leader>gb", gs.blame_line, "Git blame de la ligne")
        map("n", "<leader>gr", gs.reset_hunk, "Annuler le changement")
      end,
    })
  end,
}
