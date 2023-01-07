local lualine = require('lualine')
local c = require("tonight.colours")

local config = {
    options = {
        theme = "tonight",
        icons_enabled = false,
        component_separators = {},
        section_separators = {},
        disabled_filetypes = {},
        always_divide_middle = true,
    },
    sections = {
        lualine_a = { -- Mode
            {
                function()
                    return '▊'
                end,
                color = {
                    fg = c.background_05
                },
                padding = {
                    left = 0,
                    right = 1,
                },
            },
            { 'mode' },
        },
        lualine_b = { -- Git
            { 'branch' },
            { 'diff',
                diff_color = {
                    -- Same color values as the general color option can be used here.
                    added    = { fg = c.green },    -- Changes the diff's added color
                    modified = { fg = c.yellow }, -- Changes the diff's modified color
                    removed  = { fg = c.red }, -- Changes the diff's removed color you
                },
            },
        },
        lualine_c = {
            {
                'filename',
                path = 0,
                symbols = {
                    modified = '[+]',
                    readonly = '[-]',
                    unnamed = '[No Name]',
                    newfile = '[New File]',
                },
            }
        },
        lualine_x = {},
        lualine_y = {'filetype'}, -- File info
        lualine_z = { -- Positional
            'progress',
            'location',
            {
                function()
                    return '▊'
                end,
                color = {
                    fg = c.background_05
                },
                padding = {
                    left = 1,
                    right = 0,
                },
            },
        },
    },
    inactive_sections = {}, -- laststatus = 3 aka don't need this probably
    tabline = {},
    extensions = {},
}



lualine.setup(config)
