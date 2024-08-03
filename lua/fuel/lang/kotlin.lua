local util = require'fuel.util'

return {
    build = function (file_with_extension, file)
        vim.cmd("autocmd BufDelete kotlin_fuel_main_console silent !rm -f /tmp/*.class && rm -drf /tmp/META-INF")
        return string.format("kotlinc %s -d /tmp && kotlin -cp /tmp %sKt && rm -f /tmp/*.class && rm -drf /tmp/META-INF 2> /dev/null",
            file_with_extension, file)
    end,
    get_statusline = function(file)
        return util.statusline_style(" Kotlin", file)
    end,
    get_footer = function(file)
        return util.footer(" Kotlin", file)
    end
}
