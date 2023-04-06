-- ######################################################
-- # Maintainer: Javier Orfo                            #
-- # URL:        https://github.com/whiskoder/nvim-fuel #
-- ######################################################

vim.cmd[[autocmd BufEnter,BufNewFile,BufRead *.cpp lua vim.b.fuel_language = "cpp"]]
