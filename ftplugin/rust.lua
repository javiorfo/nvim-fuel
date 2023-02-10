-- ####################################################
-- # Maintainer:  Javier Orfo                         #
-- # URL:         https://github.com/javio7/nvim-fuel #
-- ####################################################

vim.cmd[[autocmd BufEnter,BufNewFile,BufRead *.rs lua vim.b.fuel_language = "rust"]]
