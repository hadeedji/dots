return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "nvim-telescope/telescope.nvim"
  },
  config = function()
    local lspconfig = require("lspconfig")

    lspconfig.clangd.setup {}

    local emmet_capabilities = vim.lsp.protocol.make_client_capabilities()
    emmet_capabilities.textDocument.completion.completionItem.snippetSupport = true
    lspconfig.emmet_ls.setup {
      capabilities = emmet_capabilities,
      filetypes = { "html", "javascriptreact", "typescriptreact" }
    }

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = require("keymaps").lsp
    })
  end
}
