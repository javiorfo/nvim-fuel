local util = require'fuel.util'
local Logger = require'fuel.logger':new("Fuel")
local setup = require'fuel'.DEFAULTS
local popcorn = require'popcorn'
local borders = require'popcorn.borders'
local M = {}

local function get_console_params(file, file_with_extension)
    local console = string.format("sp | resize %s | terminal ", setup.console_size)
    console = console .. require("fuel.lang." .. vim.b.fuel_language).build(file_with_extension, file)
    return console
end

local function create_statusline(file, language)
    local _, error = pcall(function() require('lualine') end)
    if not error then
        require'lualine'.hide()
    end

    vim.opt_local.laststatus = 2
    vim.opt_local.statusline = require("fuel.lang." .. language).get_statusline(file)
end

local function open_console(language, identifier)
    local file_with_extension = vim.fn.expand("%:p")
    local file = vim.fn.expand("%:t:r")

    vim.cmd(get_console_params(file, file_with_extension))
    vim.cmd("file " .. identifier)
    create_statusline(file, language)
    vim.cmd(vim.fn.bufwinnr(file_with_extension) .. " wincmd w")
end

local function open_console_popup(language)
    local file_with_extension = vim.fn.expand("%:p")
    local file = vim.fn.expand("%:t:r")
    local console = "start | term " .. require("fuel.lang." .. vim.b.fuel_language).build(file_with_extension, file)

    local popup_opts = {
        width = setup.console_size * 4,
        height = setup.console_size,
        border = borders.rounded_corners_border,
        title = { "󰈸 FUEL", "Boolean" },
        footer = { require("fuel.lang." .. language).get_footer(file), "String" },
        content = function()
            vim.cmd(console)
        end
    }
    popcorn:new(popup_opts):pop()
end

function M.run()
    local ft = vim.bo.filetype
    local compiler = util.compilers[ft]
    local lang = vim.b.fuel_language

    if not compiler then
       Logger:warn(string.format("The programming language %s is not supported.", ft))
       return
    end

    if vim.fn.executable(compiler) ~= 0 then
        local identifier = lang .. util.buffer_identifier
        if vim.fn.bufwinnr(identifier) >= 0 then
            vim.cmd("bd! " .. identifier)
        end

        if setup.autosave then
            vim.cmd("silent w")
        end

        if setup.popup then
            open_console_popup(lang)
        else
            open_console(lang, identifier)
        end
    else
        local message = string.format("To run %s, %s needs to be installed.", ft, compiler)
        Logger:warn(message)
    end
end

function M.close()
    for k, _ in pairs(util.compilers) do
        local local_buf = k .. util.buffer_identifier
        pcall(function()
            vim.cmd("bd! " .. local_buf)
        end)
    end
end

return M
