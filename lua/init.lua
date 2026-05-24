-- ~/.config/nvim/init.lua
-- ~/.config/nvim/init.lua

-- Bootstrap lazy.nvim (installation automatique au premier lancement)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Charger les options et raccourcis
require("options")
require("keymaps")
-- Charger les plugins
require("lazy").setup("plugins")
