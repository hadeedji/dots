------------------------------------------------------------------------------
-- Misc                                                                     --
------------------------------------------------------------------------------

vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("i", "kj", "<ESC>")

vim.keymap.set("", "<leader>q", "<CMD>confirm quit<CR>")
vim.keymap.set("", "<leader>x", "<CMD>exit<CR>")
vim.keymap.set("", "<leader>ww", "<CMD>write<CR>")
vim.keymap.set("", "<leader><leader>x", "<CMD>write<BAR>source %<CR>")

vim.keymap.set("", "n", "nzz")
vim.keymap.set("", "N", "Nzz")
vim.keymap.set("", "<C-N>", "<CMD>nohls<CR>")

vim.keymap.set("", "<C-U>", "<C-U>zz")
vim.keymap.set("", "<C-D>", "<C-D>zz")


local function swap(a, b)
  vim.keymap.set("", a, b)
  vim.keymap.set("", b, a)
end

swap(";", ":")
swap("'", "`")


vim.keymap.set("", "<leader>w", "<C-W>")
local function window_map(key, mapping)
  local k = '<M-'..key..'>'
  local m = '<CMD>wincmd ' .. (mapping or key) .. '<CR>'

  vim.keymap.set({"", "i", "t"}, k, m)
end

window_map("h")
window_map("j")
window_map("k")
window_map("l")

------------------------------------------------------------------------------
-- Plugin Maps                                                              --
------------------------------------------------------------------------------

local M = {}

function M.telescope()
  local telescope = require("telescope")
  local builtin = require("telescope.builtin")

  vim.keymap.set("", "<leader>ff", builtin.find_files)
  vim.keymap.set("", "<leader>fh", builtin.help_tags)
  vim.keymap.set("", "<leader>ft", builtin.builtin)
  vim.keymap.set("", "<leader>fm", builtin.man_pages)
  vim.keymap.set("", "<leader>fb", telescope.extensions.file_browser.file_browser)

  vim.keymap.set("", "<leader>fd", function() builtin.find_files({
    cwd = "$DOTS",
    prompt_title = "< Dotfiles >"
  }) end)
end

function M.harpoon()
  vim.keymap.set("", "<leader>ha", require("harpoon.mark").add_file)
  vim.keymap.set("", "<leader>ho", require("harpoon.ui").toggle_quick_menu)

  vim.keymap.set("", "<leader>hf", function() require("harpoon.ui").nav_file(1) end)
  vim.keymap.set("", "<leader>hd", function() require("harpoon.ui").nav_file(2) end)
  vim.keymap.set("", "<leader>hs", function() require("harpoon.ui").nav_file(2) end)
end

function M.lsp(env)
  local opts = { buffer = env.buffer }

  vim.keymap.set("", "<leader>dn", vim.diagnostic.goto_next, opts)
  vim.keymap.set("", "<leader>dp", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("", "<leader>de", vim.diagnostic.open_float, opts)
  vim.keymap.set("", "<leader>df", vim.lsp.buf.code_action, opts)
  vim.keymap.set("", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("", "<leader>gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("", "<leader>gd", vim.lsp.buf.definition, opts)
end

function M.fugitive()
  vim.keymap.set("", "<leader>gs", "<cmd>Git<cr>")
end

return M
