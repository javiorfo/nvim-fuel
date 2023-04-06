-- ######################################################
-- # Maintainer: Javier Orfo                            #
-- # URL:        https://github.com/whiskoder/nvim-fuel #
-- ######################################################

vim.cmd[[autocmd BufEnter,BufNewFile,BufRead *.c lua vim.b.fuel_language = "c"]]
