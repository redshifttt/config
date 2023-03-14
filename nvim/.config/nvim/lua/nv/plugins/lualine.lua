local lualine = require('lualine')
local c = require("tonight.colours")

local config = {
    options = {
        theme = "tonight",
        icons_enabled = true,
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
        lualine_b = { -- File
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
        },
        lualine_c = {},
        lualine_x = { -- Git
            { 'branch' },
            { -- Gitsigns
                "diff",
                source = function()
                    local status = vim.b.gitsigns_status_dict
                    if status then
                        local added = status.added
                        local removed = status.removed
                        local changed = status.changed
                        return { added = added, modified = changed, removed = removed }
                    end
                end,
            },
        },
        lualine_y = { -- File/LSP if attached
            {
                "filetype",
                color = { gui = "bold" }
            },
            {
                function()
                    local current_attached_lsp_client = vim.lsp.get_active_clients({ bufnr = 0 })[1].name
                    return "[" .. current_attached_lsp_client .. "]"
                end,
                color = { fg = c.green, gui = "bold,standout" }
            },
        },
        lualine_z = { -- Positional
            { 'progress' },
            {
                'location',
                padding = {
                    left = 0,
                    right = 1,
                },
            },
        },
    },
    inactive_sections = {}, -- laststatus = 3 so don't need this probably
    tabline = {},
    extensions = {},
}

lualine.setup(config)
