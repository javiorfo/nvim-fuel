-- ######################################################
-- # Maintainer: Mr. Charkuils                          #
-- # URL:        https://github.com/charkuils/nvim-fuel #
-- ######################################################

local util = require'fuel.util'

return {
    build = function (file_with_extension, file)
        local classpath = vim.fn.expand("%:h")
        local dot_classes = classpath .. "/*.class"
        local meta = classpath .. "/META-INF"

        vim.cmd(string.format("autocmd BufDelete kotlin_fuel_main_console silent !rm -f %s && rm -drf %s", dot_classes, meta))
        return string.format(" kotlinc %s -d %s && kotlin -cp %s %sKt && rm -f %s && rm -drf %s 2> /dev/null",
            file_with_extension, classpath, classpath, file, dot_classes, meta)
    end,
    get_statusline = function(file)
        return util.statusline_style(" Kotlin", file)
    end
}
