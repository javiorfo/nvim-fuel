-- ####################################################
-- # Maintainer:  Javier Orfo                         #
-- # URL:         https://github.com/javio7/nvim-fuel #
-- ####################################################

vim.cmd[[autocmd BufEnter,BufNewFile,BufRead *.c lua vim.b.fuel_language = "c"]]
