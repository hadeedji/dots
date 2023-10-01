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
    "sakhnik/nvim-gdb",
    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "nvimgdb",
        callback = function()
          vim.opt.number = false
          vim.opt.relativenumber = false
          vim.opt.signcolumn = 'no'

          vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
            command = "startinsert"
          })
        end
      })
    end
  },

  { "abecodes/tabout.nvim", dependencies = { "nvim-treesitter" }, config = true },

  { "numToStr/Comment.nvim",     config = true },
  { "nvim-lualine/lualine.nvim", config = true },
  { "windwp/nvim-autopairs",     config = true },

  "fladson/vim-kitty",
  "tpope/vim-unimpaired"
}
