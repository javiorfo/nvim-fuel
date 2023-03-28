-- #####################################################
-- # Maintainer: Javier Orfo                           #
-- # URL:        https://github.com/javiorfo/nvim-fuel #
-- #####################################################

vim.cmd[[autocmd BufEnter,BufNewFile,BufRead *.java lua vim.b.fuel_language = "java"]]
