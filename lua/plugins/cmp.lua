-- ~/.config/nvim/lua/plugins/cmp.lua
return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",     -- Source LSP
    "hrsh7th/cmp-buffer",       -- Source buffer courant
    "hrsh7th/cmp-path",         -- Source chemins de fichiers
    "L3MON4D3/LuaSnip",         -- Moteur de snippets
    "saadparwaiz1/cmp_luasnip", -- Source snippets pour cmp
    "rafamadriz/friendly-snippets", -- Collection de snippets
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    -- Charger les snippets de friendly-snippets
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },  -- Suggestions du LSP en priorité
        { name = "luasnip" },   -- Snippets
        { name = "buffer" },    -- Mots du buffer courant
        { name = "path" },      -- Chemins de fichiers
      }),
    })
  end,
}
