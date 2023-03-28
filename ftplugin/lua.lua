-- #####################################################
-- # Maintainer: Javier Orfo                           #
-- # URL:        https://github.com/javiorfo/nvim-fuel #
-- #####################################################

vim.cmd[[autocmd BufEnter,BufNewFile,BufRead *.lua lua vim.b.fuel_language = "lua"]]
