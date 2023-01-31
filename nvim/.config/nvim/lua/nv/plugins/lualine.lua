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
                'mode',
                padding = {
                    left = 2,
                    right = 0,
                },
            },
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
        lualine_c = { -- File
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
        lualine_x = { -- LSP
            {
                function()
                    local current_attached_lsp_client = vim.lsp.get_active_clients({ bufnr = 0 })[1].name
                    return "LSP: " .. current_attached_lsp_client
                end
            }
        },
        lualine_y = {'filetype'}, -- File info
        lualine_z = { -- Positional
            'progress',
            {
                'location',
                padding = {
                    left = 0,
                    right = 2,
                },
            },
        },
    },
    inactive_sections = {}, -- laststatus = 3 aka don't need this probably
    tabline = {},
    extensions = {},
}



lualine.setup(config)
