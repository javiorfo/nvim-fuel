-- #####################################################
-- # Maintainer:  Javier Orfo                          #
-- # URL:         https://github.com/javio7/nvim-flame #
-- #####################################################

vim.cmd[[autocmd BufEnter,BufNewFile,BufRead *.scala,*.sc lua vim.b.flame_language = "scala"]]
