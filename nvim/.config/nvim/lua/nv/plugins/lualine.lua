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
                    left = 1,
                    right = 0,
                },
            },
        },
        lualine_b = { -- Git
            { 'branch' },
            { -- Gitsigns
                "diff",
                source = function()
                    local status = vim.b.gitsigns_status_dict
                    if not status then
                        return { added = 0, modified = 0, removed = 0 }
                    else
                        local added = status.added
                        local removed = status.removed
                        local changed = status.changed
                        return { added = added, modified = changed, removed = removed }
                    end
                end,
            }
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
            },
            { "filetype" },
        },
        lualine_x = { -- LSP
            {
                function()
                    local current_attached_lsp_client = vim.lsp.get_active_clients({ bufnr = 0 })[1].name
                    return "LSP: " .. current_attached_lsp_client
                end
            }
        },
        lualine_y = {}, -- File info
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
