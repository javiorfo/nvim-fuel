-- ########################################################
-- # Maintainer:  Javier Orfo                             #
-- # URL:         https://github.com/javi-7/nvim-executor #
-- ########################################################

if vim.g.executor then
  return
end

vim.g.executor = 1

vim.api.nvim_set_keymap('n', '<Plug>ExecutorRun', '<cmd>lua require("executor.core").run()<CR>', {})
vim.api.nvim_set_keymap('n', '<Plug>ExecutorClose', '<cmd>lua require("executor.core").close()<CR>', {})
