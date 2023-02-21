-- #####################################################
-- # Maintainer: Javier Orfo                           #
-- # URL:        https://github.com/javiorfo/nvim-fuel #
-- #####################################################

vim.cmd[[autocmd BufEnter,BufNewFile,BufRead *.scala,*.sc lua vim.b.fuel_language = "scala"]]
