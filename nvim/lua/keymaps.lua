local function swap(a, b)
  vim.keymap.set("", a, b)
  vim.keymap.set("", b, a)
end

swap(";", ":")
swap("'", "`")

vim.keymap.set("", "<leader>q", "<CMD>conf q<CR>")
vim.keymap.set("", "<leader>w", "<CMD>w<CR>")
vim.keymap.set("", "<leader>x", "<CMD>x<CR>")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set("n", "<C-U>", "<C-U>zz")
vim.keymap.set("n", "<C-D>", "<C-D>zz")
vim.keymap.set("n", "<C-N>", "<CMD>nohls<CR>")

vim.keymap.set("n", "<leader>w", "<C-W>")
local function window_map(key, mapping)
  local k = '<M-'..key..'>'
  local m = '<CMD>wincmd ' .. (mapping or key) .. '<CR>'

  vim.keymap.set({'n', 'i', 't'}, k, m)
end

window_map("h")
window_map("j")
window_map("k")
window_map("l")
