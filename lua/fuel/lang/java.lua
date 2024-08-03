local util = require'fuel.util'

return {
    build = function (file_with_extension, file)
        vim.cmd("autocmd BufDelete java_fuel_main_console silent !rm -f /tmp/*.class")
        return string.format("javac -d /tmp %s -Xlint:all -Xdiags:verbose && java -cp /tmp %s && rm -f /tmp/*.class 2> /dev/null", file_with_extension, file, file)
    end,
    get_statusline = function(file)
        return util.statusline_style(" Java", file)
    end,
    get_footer = function(file)
        return util.footer(" Java", file)
    end
}

