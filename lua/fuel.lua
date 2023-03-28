-- #####################################################
-- # Maintainer: Javier Orfo                           #
-- # URL:        https://github.com/javiorfo/nvim-fuel #
-- #####################################################

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
    console_size = 10,
    autosave = true
}

function M.setup(opts)
   if opts.console_size then
       M.DEFAULTS.console_size = opts.console_size
   end
    if opts.autosave then
       M.DEFAULTS.autosave = opts.autosave
   end
end

return M
