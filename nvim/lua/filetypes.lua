vim.filetype.add({
  filename = {
    ["user-dirs.dirs"]  = "conf",

    ["gruvbox.conf"]    = "kitty",
    ["keys.conf"]       = "kitty",
    ["kitty.conf"]      = "kitty",
    ["ssh.conf"]      = "kitty",

    ["dot-zshenv"]      = "zsh",
    ["dot-zshrc"]       = "zsh"
  },
  pattern = {
    [".*/git/config"] = "gitconfig"
  }
})

vim.api.nvim_create_autocmd('Filetype', {
  group = vim.api.nvim_create_augroup('setIndent', { clear = true }),
  pattern = { "lua", "html" },
  command = 'setlocal tabstop=2 softtabstop=2 shiftwidth=2'
})
