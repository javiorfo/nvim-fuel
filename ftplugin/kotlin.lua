-- ######################################################
-- # Maintainer: Mr. Charkuils                          #
-- # URL:        https://github.com/charkuils/nvim-fuel #
-- ######################################################

vim.cmd[[autocmd BufEnter,BufNewFile,BufRead *.kt,*.kts lua vim.b.fuel_language = "kotlin"]]
