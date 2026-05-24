# Publier et synchroniser sa config Neovim sur GitHub

## Contexte

L'objectif est d'avoir une config Neovim identique sur tous ses ordinateurs,
en la versionant sur GitHub — comme le dépôt `vimrc` déjà existant.

Avantage par rapport à vim : **pas besoin de lien symbolique**.
Neovim lit directement `~/.config/nvim/`, il suffit de cloner le dépôt là.

---

## Étape 1 — Créer le dépôt GitHub

1. Aller sur https://github.com/pierrotlemekcho
2. Cliquer sur **New repository**
3. Remplir :
   - **Name** : `nvim`
   - **Visibility** : Public
   - **Ne pas** cocher "Add a README" (on le crée manuellement)
4. Cliquer sur **Create repository**

---

## Étape 2 — Préparer le dépôt local

```bash
cd ~/.config/nvim

# Initialiser git
git init
git branch -M main

# Lier au dépôt GitHub
git remote add origin https://github.com/pierrotlemekcho/nvim.git
```

---

## Étape 3 — Créer le .gitignore

```bash
cat > ~/.config/nvim/.gitignore << 'EOF'
# Cache et données runtime (générées automatiquement)
/plugin/
EOF
```

> **Note sur `lazy-lock.json`** : ce fichier verrouille les versions exactes
> des plugins. Le garder dans git garantit des versions **identiques** sur tous
> les postes (recommandé). Si tu préfères toujours avoir la dernière version
> de chaque plugin, ajoute-le au `.gitignore`.

---

## Étape 4 — Créer le README

```bash
cat > ~/.config/nvim/README.md << 'EOF'
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

```
:Mason
```

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

```
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
```
EOF
```

---

## Étape 5 — Premier commit et push

```bash
cd ~/.config/nvim

git add .
git commit -m "init: config nvim initiale"
git push -u origin main
```

---

## Étape 6 — Sur un nouvel ordinateur

```bash
# 1. Installer les prérequis
sudo apt install neovim xclip git

# 2. Cloner la config
git clone https://github.com/pierrotlemekcho/nvim.git ~/.config/nvim

# 3. Lancer nvim — tout s'installe automatiquement
nvim

# 4. Installer les serveurs LSP
# Dans nvim : :Mason
```

---

## Workflow quotidien

### Modifier sa config et synchroniser

```bash
cd ~/.config/nvim

# Voir les fichiers modifiés
git status

# Ajouter et commiter
git add .
git commit -m "feat: ajout yamlls dans lsp"
git push
```

### Récupérer les modifications sur un autre poste

```bash
cd ~/.config/nvim
git pull

# Dans nvim, mettre à jour les plugins si lazy-lock.json a changé :
# :Lazy sync
```

---

## Comparaison vim vs nvim

| | vim (vimrc) | nvim |
|---|---|---|
| Fichier de config | `~/.vimrc` | `~/.config/nvim/init.lua` |
| Lien symbolique nécessaire | ✅ Oui (`ln -s`) | ❌ Non |
| Gestionnaire de plugins | Vundle | lazy.nvim |
| Installation après clone | `:PluginInstall` + compiler YCM | automatique au 1er lancement |
| Serveurs LSP | ALE + binaires manuels | Mason (`:Mason`) |
| Langage de config | VimScript | Lua |

---

## Commandes utiles rappel

| Commande | Description |
|---|---|
| `:Lazy` | Ouvrir le gestionnaire de plugins |
| `:Lazy sync` | Mettre à jour tous les plugins |
| `:Mason` | Ouvrir le gestionnaire de serveurs LSP |
| `:TSUpdate` | Mettre à jour les parsers treesitter |
| `:checkhealth` | Diagnostic général de Neovim |
| `:LspInfo` | Statut des serveurs LSP actifs |
| `:messages` | Voir les derniers messages/erreurs |
