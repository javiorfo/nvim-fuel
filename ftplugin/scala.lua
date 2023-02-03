-- ########################################################
-- # Maintainer:  Javier Orfo                             #
-- # URL:         https://github.com/javio7/nvim-executor #
-- ########################################################

vim.cmd[[autocmd BufEnter,BufNewFile,BufRead *.scala,*.sc lua vim.b.executor_language = "scala"]]
