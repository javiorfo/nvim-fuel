-- ######################################################
-- # Maintainer: Javier Orfo                            #
-- # URL:        https://github.com/whiskoder/nvim-fuel #
-- ######################################################

vim.cmd[[autocmd BufEnter,BufNewFile,BufRead *.hs,*.lhs lua vim.b.fuel_language = "haskell"]]
