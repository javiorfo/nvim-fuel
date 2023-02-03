-- ########################################################
-- # Maintainer:  Javier Orfo                             #
-- # URL:         https://github.com/javio7/nvim-executor #
-- ########################################################

vim.cmd[[autocmd BufEnter,BufNewFile,BufRead *.py lua vim.b.executor_language = "python"]]
