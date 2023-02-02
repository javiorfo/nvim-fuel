-- ########################################################
-- # Maintainer:  Javier Orfo                             #
-- # URL:         https://github.com/javi-7/nvim-executor #
-- ########################################################

local utils = require'executor.utils'

return {
    build = function (file_with_extension, file)
        local classpath = vim.fn.expand("%:h")
        local dot_classes = classpath .. "/*.class"
        local meta = classpath .. "/META-INF"

        return string.format(" kotlinc %s -d %s;kotlin -cp %s %sKt; rm -f %s; rm -drf %s",
            file_with_extension, classpath, classpath, file, dot_classes, meta)
    end,
    get_statusline = function(file)
        return utils.statusline_style(" Kotlin", file)
    end
}
