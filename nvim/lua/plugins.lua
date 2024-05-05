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
      require("leap").add_default_mappings()
      vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })
    end
  },

  {
    "ThePrimeagen/harpoon",
    config = function()
      require("keymaps").harpoon()
    end
  },

  {
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
  },

  { "abecodes/tabout.nvim",      config = true },
  { "numToStr/Comment.nvim",     config = true },
  { "nvim-lualine/lualine.nvim", config = true },
  { "windwp/nvim-autopairs",     config = true },

  {"tpope/vim-fugitive", config = require("keymaps").fugitive},
  "tpope/vim-repeat",
  "tpope/vim-surround",
  "tpope/vim-unimpaired",

  "fladson/vim-kitty",
  "cljoly/minimal-format.nvim"
}
