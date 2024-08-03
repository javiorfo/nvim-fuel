local M = {}

vim.cmd [[
    augroup fuel_statusline
        autocmd!
        autocmd BufDelete *_fuel_main_console lua pcall(function() require('lualine').hide({unhide=true}) end)
    augroup end

    augroup console_prevent_bad_closing
	    autocmd QuitPre *_fuel_main_console :q!
    augroup end

    setl noea
]]

M.DEFAULTS = {
    view = {
        console_size = 10,
        autosave = true,
        popup = false
    }
}

function M.setup(opts)
    if opts.view then
        local view = opts.view
        if view.console_size then
            M.DEFAULTS.view.console_size = view.console_size
        end
        if view.autosave ~= nil then
            M.DEFAULTS.view.autosave = view.autosave
        end
        if view.popup ~= nil then
            M.DEFAULTS.view.popup = view.popup
        end
    end
    if opts.language_implementations then
       M.DEFAULTS.language_implementations = opts.language_implementations
    end
end

return M
