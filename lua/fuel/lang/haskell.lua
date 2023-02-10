-- ######################################################
-- # Maintainer: Mr. Charkuils                          #
-- # URL:        https://github.com/charkuils/nvim-fuel #
-- ######################################################

local util = require'fuel.util'

return {
    build = function (file_with_extension, file)
        file = vim.fn.expand("%:h") .. "/" .. file
        return string.format(" ghc -dynamic -v0 %s; %s;rm -f %s.o %s.hi %s", file_with_extension, file, file, file, file)
    end,
    get_statusline = function(file)
        return util.statusline_style(" Haskell", file)
    end
}
