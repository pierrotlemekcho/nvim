# nvim

Ma configuration Neovim personnelle — gérée avec [lazy.nvim](https://github.com/folke/lazy.nvim).

## Prérequis

```bash
# Neovim >= 0.11
sudo apt install neovim

# Presse-papier X11 (copier-coller système)
sudo apt install xclip

# Git (requis par lazy.nvim)
sudo apt install git
```

## Installation sur un nouvel ordinateur

```bash
# 1. Cloner la config au bon endroit
git clone https://github.com/pierrotlemekcho/nvim.git ~/.config/nvim

# 2. Lancer nvim — lazy.nvim s'installe et installe tous les plugins automatiquement
nvim
```

Au premier lancement, patienter quelques secondes le temps que lazy.nvim
télécharge et installe tous les plugins.

## Serveurs LSP

Les serveurs LSP ne sont pas inclus dans le dépôt (ils sont installés localement).
Après clonage, ouvrir nvim et lancer :
:Mason

Installer les serveurs souhaités (touche `i` sur chaque) :

| Serveur Mason          | Nom dans lsp.lua   | Langage        |
|------------------------|--------------------|----------------|
| lua-language-server    | lua_ls             | Lua            |
| pyright                | pyright            | Python         |
| bash-language-server   | bashls             | Bash/Shell     |
| yaml-language-server   | yamlls             | YAML           |
| dockerfile-language-server | dockerls       | Dockerfile     |
| terraform-ls           | terraformls        | Terraform/HCL  |
| json-lsp               | jsonls             | JSON           |

Puis activer dans `lua/plugins/lsp.lua` :

```lua
vim.lsp.enable({
  "lua_ls", "pyright", "bashls", "yamlls",
  "dockerls", "terraformls", "jsonls",
})
```

## Mise à jour des plugins

```vim
:Lazy sync
```

## Structure
~/.config/nvim/
├── init.lua                  # Point d'entrée, bootstrap lazy.nvim
├── lazy-lock.json            # Versions verrouillées des plugins
├── lua/
│   ├── keymaps.lua           # Raccourcis clavier
│   ├── options.lua           # Options vim + PATH Mason/mise
│   └── plugins/
│       ├── cmp.lua           # Autocomplétion (nvim-cmp + LuaSnip)
│       ├── colorscheme.lua   # Thème de couleurs
│       ├── gitsigns.lua      # Signes Git dans la gouttière
│       ├── lsp.lua           # LSP (Mason + nvim-lspconfig)
│       ├── lualine.lua       # Barre de statut
│       ├── misc.lua          # Plugins divers
│       ├── neo-tree.lua      # Explorateur de fichiers
│       ├── telescope.lua     # Recherche floue
│       └── treesitter.lua    # Coloration syntaxique avancée
