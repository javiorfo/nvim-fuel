-- ####################################################
-- # Maintainer:  Javier Orfo                         #
-- # URL:         https://github.com/javio7/nvim-fuel #
-- ####################################################

local util = require'fuel.util'

return {
    build = function (file_with_extension, file)
        file = vim.fn.expand("%:h") .. "/" .. file
        return string.format(" gcc %s -o %s; %s; rm -f %s", file_with_extension, file, file, file)
    end,
    get_statusline = function(file)
        return util.statusline_style(" C", file)
    end
}
