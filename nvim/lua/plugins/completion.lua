return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-path"
  },
  config = function()
    local cmp = require("cmp")

    cmp.setup {
      mapping = cmp.mapping.preset.insert {
        ["<C-K>"] = function(fallback)
          if cmp.visible() then
            cmp.confirm { select=true }
          else
            fallback()
          end
        end
      },
      sources = {
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "buffer" },
        { name = "path" }
      },
      experimental = {
        native_menu = false,
        ghost_text = { hl_group = "Comment" }
      }
    }
  end
}
