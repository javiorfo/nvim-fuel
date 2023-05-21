local util = require'fuel.util'

return {
    build = function (file_with_extension, file)
        local path = vim.fn.expand("%:h")
        local path_w_file = path .. "/" .. file

        vim.cmd("autocmd BufDelete asm_fuel_main_console silent !rm -f " .. path_w_file)
        return string.format(" as %s -o %s.o && ld %s.o -o %s && %s 2> /dev/null", file_with_extension, path_w_file,
            path_w_file, path_w_file, path_w_file)
    end,
    get_statusline = function(file)
        return util.statusline_style("  Assembly", file)
    end,
    get_footer = function(file)
        return util.footer("  Assembly", file)
    end

}
