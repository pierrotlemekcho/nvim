## Installation de Neovim (hors APT)

Neovim est installé à partir de l'**archive officielle** publiée sur GitHub, et non via APT ou un PPA :

- version **stable** récente (0.12+), nécessaire à cette config (`vim.lsp.enable()`, nvim-treesitter récent) ;
- binaire autonome : **non affecté par les mises à niveau d'Ubuntu** (`do-release-upgrade`) ;
- installation et désinstallation en une commande.

Emplacements :

| Élément | Chemin |
|---|---|
| Binaire Neovim | `/opt/nvim-linux-x86_64/` (lien : `/usr/local/bin/nvim`) |
| CLI tree-sitter | `/usr/local/bin/tree-sitter` |
| Configuration (ce dépôt) | `~/.config/nvim/` |
| Greffons (lazy.nvim) | `~/.local/share/nvim/lazy/` |

### Prérequis

```bash
sudo apt install git curl tar gcc xclip
```

`gcc` sert à compiler les analyseurs Treesitter, et `xclip` au copier-coller avec le presse-papiers système.

### Installer ou mettre à jour Neovim

La même commande sert pour la première installation et pour les mises à jour : elle remplace l'ancienne version.

```bash
cd /tmp
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
sudo ln -sf /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim
hash -r
which nvim && nvim --version | head -1    # attendu : /usr/local/bin/nvim
```

### Installer ou mettre à jour tree-sitter CLI

Ce n'est nécessaire que pour compiler de nouveaux analyseurs de langage.

```bash
cd /tmp
curl -LO https://github.com/tree-sitter/tree-sitter/releases/latest/download/tree-sitter-linux-x64.gz
gunzip -f tree-sitter-linux-x64.gz
sudo install -m 755 tree-sitter-linux-x64 /usr/local/bin/tree-sitter
tree-sitter --version
```

### Installer la configuration sur un nouveau poste

```bash
git clone git@github.com:pierrotlemekcho/nvim.git ~/.config/nvim
nvim --headless "+Lazy! restore" "+qa"    # installe les greffons aux versions de lazy-lock.json
```

⚠️ `init.lua` et `lazy-lock.json` doivent se trouver **à la racine** de `~/.config/nvim/`, et non dans `lua/`. Sinon, Neovim démarre sans aucune configuration.

### Mettre à jour les greffons

```bash
nvim --headless "+Lazy! sync" "+qa"
nvim --headless "+checkhealth" "+w! /tmp/health.txt" "+qa"; grep -c ERROR /tmp/health.txt
cd ~/.config/nvim && git commit -am "lazy-lock: mise à jour des greffons" && git push
```

`lazy-lock.json` fige les versions des greffons. Le versionner permet de retrouver un état qui fonctionne avec `:Lazy restore`.

Une seule `ERROR` reste normale : celle sur `luarocks`, dont aucun greffon de cette config n'a besoin.

### Désinstaller

```bash
sudo rm -rf /opt/nvim-linux-x86_64 /usr/local/bin/nvim /usr/local/bin/tree-sitter
```


