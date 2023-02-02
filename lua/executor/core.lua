-- ########################################################
-- # Maintainer:  Javier Orfo                             #
-- # URL:         https://github.com/javi-7/nvim-executor #
-- ########################################################

local utils = require'executor.utils'
local Logger = utils.Logger
local setup = require'executor'.DEFAULTS
local M = {}

local function get_console_params(file, file_with_extension)
    local console = string.format("sp | resize %s | terminal ", setup.console_size)
    console = console .. require("executor.lang." .. vim.b.executor_language).build(file_with_extension, file)
    return console
end

local function create_statusline(file, language)
    local _, error = pcall(function() require('lualine') end)
    if not error then
        require'lualine'.hide()
    end

    vim.opt_local.laststatus = 2
    vim.opt_local.statusline = require("executor.lang." .. language).get_statusline(file)
end

local function open_console(language, identifier)
    local file_with_extension = vim.fn.expand("%:p")
    local file = vim.fn.expand("%:t:r")

    vim.cmd(get_console_params(file, file_with_extension))
    vim.cmd("file " .. identifier)
    create_statusline(file, language)
    vim.cmd(vim.fn.bufwinnr(file_with_extension) .. " wincmd w")
end

function M.run()
    local ft = vim.bo.filetype
    local compiler = utils.compilers[ft]
    local lang = vim.b.executor_language

    if not compiler then
       Logger:warn(string.format("The programming language %s is not supported.", ft))
       return
    end

    if vim.fn.executable(compiler) ~= 0 then
        local identifier = lang .. utils.buffer_identifier
        if vim.fn.bufwinnr(identifier) >= 0 then
            vim.cmd("bd! " .. identifier)
        end
        if setup.autosave then
            vim.cmd("w")
        end
        open_console(lang, identifier)
    else
        local message = string.format("To run %s, %s needs to be installed.", lang, compiler)
        Logger:warn(message)
    end
end

function M.close()
    for k, _ in pairs(utils.compilers) do
        local local_buf = k .. utils.buffer_identifier
        pcall(function()
            vim.cmd("bd! " .. local_buf)
        end)
    end
end

return M
