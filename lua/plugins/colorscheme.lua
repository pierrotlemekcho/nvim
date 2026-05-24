-- ~/.config/nvim/lua/plugins/colorscheme.lua
return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,  -- Charger en premier (avant les autres plugins)
  config = function()
    require("gruvbox").setup({
      contrast = "hard",  -- "hard", "soft" ou "" (défaut)
    })
    vim.cmd.colorscheme("gruvbox")
  end,
}
