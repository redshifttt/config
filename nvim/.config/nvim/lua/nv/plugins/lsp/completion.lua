local cmp = require('cmp')

local signs = {
    Error = " ┃",
    Warn  = " ┃",
    Hint  = " ┃",
    Info  = " ┃"
}
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {
        text = icon,
        texthl = hl,
        numhl = hl,
    })
end

-- Completion
cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    mapping = {
        ["<C-Space>"] = cmp.mapping.complete({
            config = {
                sources = {
                    { name = 'luasnip' },
                    { name = 'rg' },
                }
            }
        }),
        ["<Esc>"] = cmp.mapping.close(),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<C-n>"] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end,
        ["<C-p>"] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end,
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = "nvim_lua" },
        { name = "path" },
        { name = "buffer" },
    })
})
