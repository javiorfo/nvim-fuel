-- #######################################################
-- # Maintainer: System Malt                             #
-- # URL:        https://github.com/systemmalt/nvim-fuel #
-- #######################################################

vim.cmd[[autocmd BufEnter,BufNewFile,BufRead *.lua lua vim.b.fuel_language = "lua"]]
