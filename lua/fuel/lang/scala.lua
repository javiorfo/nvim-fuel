local util = require'fuel.util'

return {
    build = function (file_with_extension)
        return string.format(" scala %s 2> /dev/null", file_with_extension)
    end,
    get_statusline = function(file)
        return util.statusline_style(" Scala", file)
    end,
    get_footer = function(file)
        return util.footer(" Scala", file)
    end

}
