return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "nvim-telescope/telescope.nvim"
  },
  config = function()
    local lspconfig = require("lspconfig")

    lspconfig.clangd.setup {}

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = require("keymaps").lsp
    })
  end
}
