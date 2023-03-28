-- #####################################################
-- # Maintainer: Javier Orfo                           #
-- # URL:        https://github.com/javiorfo/nvim-fuel #
-- #####################################################

vim.cmd[[autocmd BufEnter,BufNewFile,BufRead *.hs,*.lhs lua vim.b.fuel_language = "haskell"]]
