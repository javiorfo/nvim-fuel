-- ########################################################
-- # Maintainer:  Javier Orfo                             #
-- # URL:         https://github.com/javi-7/nvim-executor #
-- ########################################################

local utils = require'executor.utils'

return {
    build = function (file_with_extension, file)
        local classpath = vim.fn.expand("%:h")
        local dot_classes = classpath .. "/*.class"

        return string.format(" javac %s;java -cp %s %s;rm -f %s", file_with_extension, classpath, file, dot_classes)
    end,
    get_statusline = function(file)
        return utils.statusline_style(" Java", file)
    end
}

