-- ~/.config/nvim/lua/plugins/treesitter.lua
return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.config").setup({
      ensure_installed = {
        "bash", "c", "css", "dockerfile", "go", "hcl",
        "html", "javascript", "json", "lua", "markdown",
        "python", "rust", "terraform", "toml", "typescript",
        "vim", "vimdoc", "yaml",
      },
    })

    -- Activer la coloration par filetype
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "bash", "sh", "c", "css", "dockerfile", "go", "hcl",
        "html", "javascript", "json", "lua", "markdown",
        "python", "rust", "typescript", "vim", "yaml",
      },
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })

    -- Pliage de code
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "bash", "sh", "c", "go", "javascript", "json", "lua",
        "python", "rust", "typescript", "yaml",
      },
      callback = function()
        vim.wo.foldmethod = "expr"
        vim.wo.foldexpr   = "v:lua.vim.treesitter.foldexpr()"
        vim.wo.foldenable = false
      end,
    })
  end,
}
