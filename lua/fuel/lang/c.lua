local util = require'fuel.util'

return {
    build = function (file_with_extension, file)
        file = vim.fn.expand("%:h") .. "/" .. file
        vim.cmd("autocmd BufDelete c_fuel_main_console silent !rm -f " .. file)
        return string.format(" gcc %s -o %s && %s && rm -f %s 2> /dev/null", file_with_extension, file, file, file)
    end,
    get_statusline = function(file)
        return util.statusline_style(" C", file)
    end
}
