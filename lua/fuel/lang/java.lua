-- #####################################################
-- # Maintainer: Javier Orfo                           #
-- # URL:        https://github.com/javiorfo/nvim-fuel #
-- #####################################################

local util = require'fuel.util'

return {
    build = function (file_with_extension, file)
        local classpath = vim.fn.expand("%:h")
        local dot_classes = classpath .. "/*.class"

        vim.cmd("autocmd BufDelete java_fuel_main_console silent !rm -f " .. dot_classes)
        return string.format(" javac %s -Xlint:all && java -cp %s %s && rm -f %s 2> /dev/null", file_with_extension, classpath, file, dot_classes)
    end,
    get_statusline = function(file)
        return util.statusline_style(" Java", file)
    end
}

