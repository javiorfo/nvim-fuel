-- ########################################################
-- # Maintainer:  Javier Orfo                             #
-- # URL:         https://github.com/javi-7/nvim-executor #
-- ########################################################

local utils = require'executor.utils'

return {
    build = function (file_with_extension)
        return string.format(" python %s", file_with_extension)
    end,
    get_statusline = function(file)
        return utils.statusline_style(" Python", file)
    end
}
