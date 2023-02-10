-- #####################################################
-- # Maintainer:  Javier Orfo                          #
-- # URL:         https://github.com/javio7/nvim-flame #
-- #####################################################

local M = {}

vim.cmd [[
    augroup flame_statusline
        autocmd!
        autocmd BufDelete *_flame_main_console lua pcall(function() require('lualine').hide({unhide=true}) end)
    augroup end

    augroup console_prevent_bad_closing 
	    autocmd QuitPre *_flame_main_console :q!
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
