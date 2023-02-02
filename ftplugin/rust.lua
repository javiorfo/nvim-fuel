-- ########################################################
-- # Maintainer:  Javier Orfo                             #
-- # URL:         https://github.com/javi-7/nvim-executor #
-- ########################################################

vim.cmd[[autocmd BufEnter,BufNewFile,BufRead *.rs lua vim.b.executor_language = "rust"]]
