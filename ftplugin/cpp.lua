-- #######################################################
-- # Maintainer: System Malt                             #
-- # URL:        https://github.com/systemmalt/nvim-fuel #
-- #######################################################

vim.cmd[[autocmd BufEnter,BufNewFile,BufRead *.cpp lua vim.b.fuel_language = "cpp"]]
