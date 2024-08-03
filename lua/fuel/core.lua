local util = require 'fuel.util'
local Logger = require 'fuel.logger':new("Fuel")
local setup = require 'fuel'.DEFAULTS
local popcorn = require 'popcorn'
local borders = require 'popcorn.borders'
local M = {}

local function get_language_implementation_or_fallback(language)
    local lang_impl = setup.language_implementations
    if lang_impl and lang_impl[language] then
        return lang_impl[language]
    else
        return require("fuel.lang." .. language)
    end
end

local function get_console_params(file, file_with_extension)
    local console = string.format("sp | resize %s | terminal ", setup.view.console_size)
    console = console .. get_language_implementation_or_fallback(vim.bo.filetype).build(file_with_extension, file)
    return console
end

local function create_statusline(file, language)
    local _, error = pcall(function() require('lualine') end)
    if not error then
        require 'lualine'.hide()
    end

    vim.opt_local.laststatus = 2
    vim.opt_local.statusline = get_language_implementation_or_fallback(language).get_statusline(file)
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
    local lang_impl = get_language_implementation_or_fallback(language)

    local popup_opts = {
        width = setup.view.console_size * 4,
        height = setup.view.console_size,
        border = borders.rounded_corners_border,
        title = { "󰈸 FUEL", "Boolean" },
        footer = { lang_impl.get_footer(file), "String" },
        content = function()
            vim.cmd("start | term " .. lang_impl.build(file_with_extension, file))
        end
    }
    popcorn:new(popup_opts):pop()
end

function M.run()
    local ft = vim.bo.filetype
    local compiler = util.compilers[ft] or (setup.language_implementations and setup.language_implementations[ft])

    if not compiler then
        Logger:warn(string.format("The programming language %s is not configured.", ft))
        return
    end

    if vim.fn.executable(compiler) ~= 0 then
        local identifier = ft .. util.buffer_identifier
        if vim.fn.bufwinnr(identifier) >= 0 then
            vim.cmd("bd! " .. identifier)
        end

        if setup.view.autosave then
            vim.cmd("silent w")
        end

        if setup.view.popup then
            open_console_popup(ft)
        else
            open_console(ft, identifier)
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

function M.info()
    local ft = vim.bo.filetype
    local file_with_extension = vim.fn.expand("%:p")
    local file = vim.fn.expand("%:t:r")
    local lang_impl = get_language_implementation_or_fallback(ft).build(file_with_extension, file)

    local msg = "󰈸 Built in"
    if setup.language_implementations and setup.language_implementations[ft] then
        msg = " Configured by the user"
    end

    local popup_opts = {
        width = #lang_impl + 6,
        height = 7,
        border = borders.rounded_corners_border,
        title = { "󰈸 FUEL INFO", "Boolean" },
        footer = { string.format("Language %s", string.upper(ft)), "String" },
        content = {
            { "Implementation:", "Type" },
            { msg },
            { "" },
            { "Command to execute:", "Type" },
            { lang_impl }
        }
    }
    popcorn:new(popup_opts):pop()
end

return M
