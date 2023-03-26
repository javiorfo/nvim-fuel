-- #######################################################
-- # Maintainer: System Malt                             #
-- # URL:        https://github.com/systemmalt/nvim-fuel #
-- #######################################################

vim.cmd[[autocmd BufEnter,BufNewFile,BufRead *.java lua vim.b.fuel_language = "java"]]
