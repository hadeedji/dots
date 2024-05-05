vim.filetype.add({
  filename = {
    ["user-dirs.dirs"]  = "conf",

    ["gruvbox.conf"]    = "kitty",
    ["keys.conf"]       = "kitty",
    ["kitty.conf"]      = "kitty",
    ["ssh.conf"]        = "kitty",

    ["dot-zshenv"]      = "zsh",
    ["dot-zshrc"]       = "zsh"
  },

  pattern = {
    [".*/git/config"]   = "gitconfig"
  }
})

vim.api.nvim_create_autocmd("Filetype", {
  group = vim.api.nvim_create_augroup("setIndent", {}),
  pattern = { "lua" },
  command = "setlocal tabstop=2 softtabstop=2 shiftwidth=2"
})

vim.api.nvim_create_autocmd("Filetype", {
  group = vim.api.nvim_create_augroup("webDev", {}),
  pattern = { "html", "css", "javascript", "javascriptreact", "json" },
  callback = function()
    vim.cmd [[setlocal tabstop=2 softtabstop=2 shiftwidth=2]]
    vim.bo.formatprg = "prettier --stdin-filepath " .. vim.fn.expand("%:p")
    require("minimal-format").toggle_autocmd(0)
  end
})
