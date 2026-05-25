# nvim

Ma configuration Neovim personnelle.

## Prérequis

```bash
# Neovim >= 0.11
sudo apt install neovim

# Presse-papier X11
sudo apt install xclip

# Git (pour lazy.nvim)
sudo apt install git
```

## Installation

```bash
# Cloner la config
git clone git@github.com:pierrotlemekcho/nvim.git ~/.config/nvim

# Lancer nvim — lazy.nvim s'installe automatiquement
nvim
```

Au premier lancement, lazy.nvim installe tous les plugins automatiquement.

## Serveurs LSP

Ouvrir nvim et lancer `:Mason` pour installer les serveurs LSP.
