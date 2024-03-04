local lsp_zero = require('lsp-zero')
local lspconfig = require('lspconfig')

lsp_zero.set_preferences({ suggest_lsp_servers = false })

lsp_zero.on_attach(
    function(client, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr })
    end
)

lspconfig.lua_ls.setup(
    lsp_zero.nvim_lua_ls()
)

lsp_zero.setup_servers({
    'pylsp',
    'nil_ls',
    'gopls'
})

lsp_zero.set_sign_icons({
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = 'ⓘ'
})

lsp_zero.setup()

local cmp = require('cmp')

-- lsp-zero already sets up mappings and
-- other stuff for cmp; this is just additional
-- sources.
cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'rg' },
    },
})
