-- ########################################################
-- # Maintainer:  Javier Orfo                             #
-- # URL:         https://github.com/javi-7/nvim-executor #
-- ########################################################

local utils = require'executor.utils'

return {
    build = function (file_with_extension)
        return string.format(" lua %s", file_with_extension)
    end,
    get_statusline = function(file)
        return utils.statusline_style(" Lua", file)
    end
}
