local util = require'fuel.util'

return {
    build = function (file_with_extension)
        return string.format(" python %s 2> /dev/null", file_with_extension)
    end,
    get_statusline = function(file)
        return util.statusline_style(" Python", file)
    end,
    get_footer = function(file)
        return util.footer(" Python", file)
    end

}
