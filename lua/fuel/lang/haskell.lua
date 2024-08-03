local util = require'fuel.util'

return {
    build = function (file_with_extension, file)
        vim.cmd(string.format("autocmd BufDelete haskell_fuel_main_console silent !rm -f /tmp/%s.o /tmp/%s.hi /tmp/%s", file, file, file))
        return string.format("ghc -dynamic -v0 %s && /tmp/%s && rm -f /tmp/%s.o /tmp/%s.hi /tmp/%s 2> /dev/null", file_with_extension, file, file, file, file)
    end,
    get_statusline = function(file)
        return util.statusline_style("  Haskell", file)
    end,
    get_footer = function(file)
        return util.footer("  Haskell", file)
    end
}
