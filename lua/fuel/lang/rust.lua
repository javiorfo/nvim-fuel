local util = require'fuel.util'

return {
    build = function (file_with_extension, file)
        vim.cmd("autocmd BufDelete rust_fuel_main_console silent !rm -f /tmp/" .. file)
        return string.format("rustc --edition 2021 --out-dir /tmp %s && /tmp/%s && rm -f /tmp/%s 2> /dev/null", file_with_extension, file, file)
    end,
    get_statusline = function(file)
        return util.statusline_style(" Rust", file)
    end,
    get_footer = function(file)
        return util.footer(" Rust", file)
    end
}
