-- ######################################################
-- # Maintainer: Mr. Charkuils                          #
-- # URL:        https://github.com/charkuils/nvim-fuel #
-- ######################################################

local util = require'fuel.util'

return {
    build = function (file_with_extension)
        return string.format(" lua %s", file_with_extension)
    end,
    get_statusline = function(file)
        return util.statusline_style(" Lua", file)
    end
}
