return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "kyazdani42/nvim-web-devicons",
    "nvim-telescope/telescope-file-browser.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
  },
  config = function()
    local telescope = require("telescope")

    telescope.setup({
      pickers = {
        man_pages = {
          sections = {"ALL"}
        }
      },
      extensions = {
        file_browser = {
          grouped = true,
          hidden = true,
          respect_gitignore = false,
          sorting_strategy = "ascending",
          layout_config = {
            prompt_position = "top"
          }
        }
      }
    })

    telescope.load_extension("file_browser")
    telescope.load_extension("fzf")

    require("keymaps").telescope()

  end
}
