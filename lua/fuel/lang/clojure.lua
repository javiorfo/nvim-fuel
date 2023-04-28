local util = require'fuel.util'

return {
    build = function (file_with_extension)
        return string.format(" clojure -M %s 2> /dev/null", file_with_extension)
    end,
    get_statusline = function(file)
        return util.statusline_style(" Clojure", file)
    end,
    get_footer = function(file)
        return util.footer(" Clojure", file)
    end

}
