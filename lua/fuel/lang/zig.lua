local util = require'fuel.util'

return {
    build = function (file_with_extension)
        return string.format("zig run %s", file_with_extension)
    end,
    get_statusline = function(file)
        return util.statusline_style(" Zig", file)
    end,
    get_footer = function(file)
        return util.footer(" Zig", file)
    end
}
