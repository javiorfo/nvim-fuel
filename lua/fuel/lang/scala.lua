-- ####################################################
-- # Maintainer:  Javier Orfo                         #
-- # URL:         https://github.com/javio7/nvim-fuel #
-- ####################################################

local util = require'fuel.util'

return {
    build = function (file_with_extension)
        return string.format(" scala %s", file_with_extension)
    end,
    get_statusline = function(file)
        return util.statusline_style(" Scala", file)
    end
}
