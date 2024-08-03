local util = require'fuel.util'

return {
    build = function (file_with_extension, file)
        vim.cmd("autocmd BufDelete scheme_fuel_main_console silent !rm -f /tmp/" .. file)
        return string.format("chicken-csc %s -o /tmp/%s && /tmp/%s && rm -f /tmp/%s 2> /dev/null", file_with_extension, file)
    end,
    get_statusline = function(file)
        return util.statusline_style("󰘧 Scheme", file)
    end,
    get_footer = function(file)
        return util.footer("󰘧 Scheme", file)
    end
}
