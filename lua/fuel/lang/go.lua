local util = require'fuel.util'

return {
    build = function (file_with_extension)
        return string.format(" go run %s", file_with_extension)
    end,
    get_statusline = function(file)
        return util.statusline_style(" Go", file)
    end,
    get_footer = function(file)
        return util.footer(" Go", file)
    end

}
