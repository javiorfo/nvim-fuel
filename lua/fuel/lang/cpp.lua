local util = require'fuel.util'

return {
    build = function (file_with_extension, file)
        vim.cmd("autocmd BufDelete cpp_fuel_main_console silent !rm -f " .. file)
        return string.format("g++ -Wall %s -o /tmp/%s && /tmp/%s && rm -f /tmp/%s 2> /dev/null", file_with_extension, file, file, file)
    end,
    get_statusline = function(file)
        return util.statusline_style(" C++", file)
    end,
    get_footer = function(file)
        return util.footer(" C++", file)
    end
}
