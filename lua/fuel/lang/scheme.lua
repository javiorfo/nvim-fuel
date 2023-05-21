local util = require'fuel.util'

return {
    build = function (file_with_extension, file)
        local path = vim.fn.expand("%:h")
        local path_w_file = path .. "/" .. file

        vim.cmd("autocmd BufDelete scheme_fuel_main_console silent !rm -f " .. path_w_file)
        return string.format(" chicken-csc %s && %s 2> /dev/null", file_with_extension, path_w_file)
    end,
    get_statusline = function(file)
        return util.statusline_style("󰘧 Scheme", file)
    end,
    get_footer = function(file)
        return util.footer("󰘧 Scheme", file)
    end

}
