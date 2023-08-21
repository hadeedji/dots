return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = "all",
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false
    },
    indent = {
      enable = true
    }
  },
  main = "nvim-treesitter.configs",
  build = ":TSUpdate"
}
