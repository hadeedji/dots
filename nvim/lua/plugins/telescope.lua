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
    local fb_actions = require("telescope").extensions.file_browser.actions

    telescope.setup({
      pickers = {
        man_pages = {
          sections = {"ALL"}
        }
      },
      extensions = {
        file_browser = {
          grouped = true,
          hide_parent_dir = true,
          hijack_netrw = true,
          initial_mode = "normal",
          respect_gitignore = false,
          sorting_strategy = "ascending",
          layout_config = {
            prompt_position = "top"
          },
          mappings = {
            n = {
              ["h"] = fb_actions.goto_parent_dir,
              ["l"] = "select_default",
              ["g"] = fb_actions.toggle_hidden
            }
          }
        }
      }
    })

    telescope.load_extension("file_browser")
    telescope.load_extension("fzf")

    local builtin = require("telescope.builtin")
    vim.keymap.set("", "<leader>tf", builtin.find_files)
    vim.keymap.set("", "<leader>th", builtin.help_tags)
    vim.keymap.set("", "<leader>tr", builtin.buffers)
    vim.keymap.set("", "<leader>ts", telescope.extensions.file_browser.file_browser)
    vim.keymap.set("", "<leader>tt", builtin.builtin)

    vim.keymap.set("", "<leader>tc", function() builtin.find_files({
      cwd = "$DOTS",
      prompt_title = "< Dotfiles >"
    }) end)
  end,
}
