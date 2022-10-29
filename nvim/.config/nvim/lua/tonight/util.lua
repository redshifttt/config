util = {}

function util.highlight(group, styles)
    vim.api.nvim_set_hl(0, group, styles)
end

return util
