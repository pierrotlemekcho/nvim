-- ~/.config/nvim/lua/options.lua


-- === PATH (mise + Mason) ===
-- Les serveurs LSP installés via Mason et les outils mis en place via mise
-- doivent être accessibles dans le PATH de Neovim
vim.env.PATH = vim.fn.expand("~/.local/share/nvim/mason/bin") .. ":" .. vim.env.PATH
-- Ajouter node/python de mise si présents
local mise_shims = vim.fn.expand("~/.local/share/mise/shims")
if vim.fn.isdirectory(mise_shims) == 1 then
  vim.env.PATH = mise_shims .. ":" .. vim.env.PATH
end

-- === Apparence ===
vim.opt.number = true         -- Numéros de ligne
vim.opt.relativenumber = true -- Numéros relatifs (utile pour 5j, 12k)
vim.opt.cursorline = true     -- Surligne la ligne du curseur
vim.opt.signcolumn = "yes"    -- Colonne de signes toujours visible (Git, diagnostics)
vim.opt.termguicolors = true  -- Active les couleurs 24 bits (true color)
vim.opt.showmode = false      -- Cache le mode (le plugin lualine l'affichera)
vim.opt.colorcolumn = "80"    -- Ligne verticale à 80 caractères

-- === Indentation ===
vim.opt.tabstop = 4           -- Une tabulation vaut 4 espaces à l'écran
vim.opt.shiftwidth = 4        -- L'indentation automatique décale de 4 espaces
vim.opt.expandtab = true      -- Insère des espaces au lieu de tabulations
vim.opt.smartindent = true    -- Indentation intelligente après {, if, etc.

-- === Recherche ===
vim.opt.ignorecase = true     -- Recherche insensible à la casse
vim.opt.smartcase = true      -- SAUF si vous tapez une majuscule
vim.opt.hlsearch = true       -- Surligne toutes les occurrences
vim.opt.incsearch = true      -- Résultats en temps réel

-- === Comportement ===
vim.opt.mouse = "a"           -- Souris activée partout
vim.opt.clipboard = "unnamedplus" -- Presse-papier système partagé
vim.opt.scrolloff = 8         -- Garde 8 lignes au-dessus/en-dessous du curseur
vim.opt.undofile = true       -- Persistent undo (historique sauvegardé sur disque)
vim.opt.swapfile = false      -- Pas de fichier swap (moins de messages au démarrage)
vim.opt.updatetime = 250      -- Délai réduit (meilleure réactivité Git/diagnostics)
vim.opt.splitright = true     -- Les splits verticaux s'ouvrent à droite
vim.opt.splitbelow = true     -- Les splits horizontaux s'ouvrent en bas

-- === Wrapping ===
vim.opt.wrap = false          -- Pas de retour à la ligne automatique
vim.opt.linebreak = true      -- Si wrap activé, coupe aux mots (pas au milieu)
