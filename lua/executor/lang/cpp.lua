-- ########################################################
-- # Maintainer:  Javier Orfo                             #
-- # URL:         https://github.com/javi-7/nvim-executor #
-- ########################################################

local utils = require'executor.utils'

return {
    build = function (file_with_extension, file)
        file = vim.fn.expand("%:h") .. "/" .. file
        return string.format(" g++ %s -o %s; %s; rm -f %s", file_with_extension, file, file, file)
    end,
    get_statusline = function(file)
        return utils.statusline_style(" C++", file)
    end
}
