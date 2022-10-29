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
        refresh = { statusline = 1 },
    },
    sections = {
        lualine_a = {
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
            { 'branch' },
        },
        lualine_b = {},
        lualine_c = {{
            'filename',
            path = 1,
            symbols = {
                modified = ' [+]',
                readonly = ' [-]',
                unnamed = ' [No Name]',
                newfile = ' [New File]',
            },
            color = {
                fg = c.white,
            },
        }},
        lualine_x = {
        -- {
        --     'lsp_progress',
        --     colors = {
        --         lsp_client_name = c.magenta,
        --         spinner = c.green,
        --         percentage = c.foreground,
        --         title = c.foreground,
        --         message = c.foreground,
        --         use = true
        --     },
        --     timer = { spinner = 200 },
        --     spinner_symbols = { "|", "/", "-", "\\" },
        -- },
        {
            'diagnostics',
            sources = { 'nvim_diagnostic' },

            -- Displays diagnostics for the defined severity types
            sections = {
                'error',
                'warn',
                'info',
                'hint',
            },

            diagnostics_color = {
                color_error = { fg = c.lsp_error },
                color_warn = { fg = c.lsp_warn },
                color_info = { fg = c.lsp_info },
                color_hint = { fg = c.lsp_hint }
            },

            symbols = {
                error = 'Error: ',
                warn = 'Warn: ',
                info = 'Info: ',
                hint = 'Hint: ',
            },
            colored = true,           -- Displays diagnostics status in color if set to true.
            update_in_insert = false, -- Update diagnostics in insert mode.
        }},
        lualine_y = {'filetype'},
        lualine_z = {
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
