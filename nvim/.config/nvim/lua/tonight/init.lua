-- tonight.nvim: lua colour scheme inspired by tomorrow and spacegray
local g = require("tonight.groups")

local function highlight(group, styles)
    vim.api.nvim_set_hl(0, group, styles)
end

for group, styles in pairs(g) do
    highlight(group, styles)
end

require('tonight.config')
