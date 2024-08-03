local util = require'fuel.util'

return {
    build = function (file_with_extension, file)
        vim.cmd("autocmd BufDelete asm_fuel_main_console silent !rm -f /tmp" .. file)
        return string.format("as %s -o /tmp/%s.o && ld /tmp/%s.o -o /tmp/%s && rm -f /tmp/%s 2> /dev/null", file_with_extension, file, file, file, file)
    end,
    get_statusline = function(file)
        return util.statusline_style("  Assembly", file)
    end,
    get_footer = function(file)
        return util.footer("  Assembly", file)
    end
}
