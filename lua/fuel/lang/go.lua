-- ######################################################
-- # Maintainer: Javier Orfo                            #
-- # URL:        https://github.com/whiskoder/nvim-fuel #
-- ######################################################

local util = require'fuel.util'

return {
    build = function (file_with_extension)
        return string.format(" go run %s 2> /dev/null", file_with_extension)
    end,
    get_statusline = function(file)
        return util.statusline_style(" Go", file)
    end
}
