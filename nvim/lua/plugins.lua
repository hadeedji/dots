return {
  {
    "ellisonleao/gruvbox.nvim",
    config = function()
      vim.cmd.colorscheme("gruvbox")
    end
  },

  {
    "ggandor/leap.nvim",
    config = function()
      require("leap").set_default_keymaps()
      vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })
    end
  },

  { "abecodes/tabout.nvim", dependencies = { "nvim-treesitter" }, config = true },

  { "numToStr/Comment.nvim",     config = true },
  { "nvim-lualine/lualine.nvim", config = true },
  { "windwp/nvim-autopairs",     config = true },

  "fladson/vim-kitty",
  "tpope/vim-unimpaired"
}
