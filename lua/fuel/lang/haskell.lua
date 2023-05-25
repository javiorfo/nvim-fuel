local util = require'fuel.util'

return {
    build = function (file_with_extension, file)
        file = vim.fn.expand("%:h") .. "/" .. file
        vim.cmd(string.format("autocmd BufDelete haskell_fuel_main_console silent !rm -f %s.o %s.hi %s", file, file, file))
        return string.format(" ghc -dynamic -v0 %s && %s && rm -f %s.o %s.hi %s 2> /dev/null", file_with_extension, file, file, file, file)
    end,
    get_statusline = function(file)
        return util.statusline_style("  Haskell", file)
    end,
    get_footer = function(file)
        return util.footer("  Haskell", file)
    end

}
