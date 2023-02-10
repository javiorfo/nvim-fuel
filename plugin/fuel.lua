-- ######################################################
-- # Maintainer: Mr. Charkuils                          #
-- # URL:        https://github.com/charkuils/nvim-fuel #
-- ######################################################

if vim.g.fuel then
  return
end

vim.g.fuel = 1

vim.api.nvim_set_keymap('n', '<Plug>Fuel', '<cmd>lua require("fuel.core").run()<CR>', {})
vim.api.nvim_set_keymap('n', '<Plug>FuelStop', '<cmd>lua require("fuel.core").close()<CR>', {})
