local lsp = require('lsp-zero')
local lspconfig = require('lspconfig')

lsp.preset({
    name = "system-lsp",
    set_lsp_keymaps = true,
    manage_nvim_cmp = true,
})

lsp.set_preferences({
    suggest_lsp_servers = false,
})

lsp.on_attach(
    function(client, bufnr)
        lsp.default_keymaps({buffer = bufnr})
    end
)

lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
lspconfig.pylsp.setup{}
lspconfig.nil_ls.setup{}

lsp.setup()
