return {
    "neovim/nvim-lspconfig",
    dependencies = {
        'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'
    },
    config = function()
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

        lspconfig.pylsp.setup({
            settings = {
                pylsp = {
                    ruff = { enabled = true }
                }
            }
        })

        lsp_zero.setup_servers({
            'pylsp',
            'gopls',
        })

        lsp_zero.set_sign_icons({
            error = '',
            warn = '',
            hint = '',
            info = ''
        })

        lsp_zero.setup()
    end
}
