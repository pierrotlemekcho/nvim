-- ~/.config/nvim/lua/keymaps.lua

-- Définir la touche Leader (Espace)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Raccourci helper
local map = vim.keymap.set

-- === Fichiers ===
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Sauvegarder" })
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quitter" })
map("n", "<leader>x", "<cmd>x<cr>", { desc = "Sauvegarder et quitter" })

-- === Navigation entre splits ===
map("n", "<C-h>", "<C-w>h", { desc = "Aller au split gauche" })
map("n", "<C-j>", "<C-w>j", { desc = "Aller au split bas" })
map("n", "<C-k>", "<C-w>k", { desc = "Aller au split haut" })
map("n", "<C-l>", "<C-w>l", { desc = "Aller au split droit" })

-- === Redimensionner les splits ===
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Agrandir split horizontal" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Réduire split horizontal" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Réduire split vertical" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Agrandir split vertical" })

-- === Buffers ===
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Buffer suivant" })
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Buffer précédent" })
map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Fermer le buffer" })

-- === Confort ===
map("n", "<leader>h", "<cmd>nohlsearch<cr>", { desc = "Effacer le surlignage recherche" })
map("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Effacer le surlignage" })
map("v", "J", ":m '>+1<cr>gv=gv", { desc = "Déplacer la sélection vers le bas" })
map("v", "K", ":m '<-2<cr>gv=gv", { desc = "Déplacer la sélection vers le haut" })
map("n", "J", "mzJ`z", { desc = "Joindre les lignes sans déplacer le curseur" })

-- === Terminal ===
map("n", "<leader>t", "<cmd>terminal<cr>", { desc = "Ouvrir un terminal" })
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Quitter le mode terminal" })
