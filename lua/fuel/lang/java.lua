-- ######################################################
-- # Maintainer: Mr. Charkuils                          #
-- # URL:        https://github.com/charkuils/nvim-fuel #
-- ######################################################

local util = require'fuel.util'

return {
    build = function (file_with_extension, file)
        local classpath = vim.fn.expand("%:h")
        local dot_classes = classpath .. "/*.class"

        return string.format(" javac %s;java -cp %s %s;rm -f %s", file_with_extension, classpath, file, dot_classes)
    end,
    get_statusline = function(file)
        return util.statusline_style(" Java", file)
    end
}

