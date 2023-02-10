-- #####################################################
-- # Maintainer:  Javier Orfo                          #
-- # URL:         https://github.com/javio7/nvim-flame #
-- #####################################################

if vim.g.flame then
  return
end

vim.g.flame = 1

vim.api.nvim_set_keymap('n', '<Plug>Flame', '<cmd>lua require("flame.core").run()<CR>', {})
vim.api.nvim_set_keymap('n', '<Plug>FlameOut', '<cmd>lua require("flame.core").close()<CR>', {})
