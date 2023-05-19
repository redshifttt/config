-- midnight.nvim: lua colour scheme inspired by tomorrow and spacegray
local g = require("midnight.groups")

for group, styles in pairs(g) do
    vim.api.nvim_set_hl(0, group, styles)
end
