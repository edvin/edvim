return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = { "go", "lua", "json", "html", "css", "yaml", "svelte", "typescript", "http" },
        highlight = { enable = true, }
      }
    end
  },
}
