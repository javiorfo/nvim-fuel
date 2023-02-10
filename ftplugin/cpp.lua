-- ####################################################
-- # Maintainer:  Javier Orfo                         #
-- # URL:         https://github.com/javio7/nvim-fuel #
-- ####################################################

vim.cmd[[autocmd BufEnter,BufNewFile,BufRead *.cpp lua vim.b.fuel_language = "cpp"]]
