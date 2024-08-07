local cmp = require('cmp')
local lspkind = require('lspkind')
local luasnip = require('luasnip')

-- lsp-zero already sets up mappings and
-- other stuff for cmp; this is just additional
-- sources.
cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'buffer' },
        { name = 'path' },
    },
    mapping = cmp.mapping.preset.insert {
        ['<C-l>'] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
                luasnip.expand_or_jump()
            end
        end, { 'i', 's' }),
        ['<C-h>'] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
                luasnip.jump(-1)
            end
        end, { 'i', 's' }),
    },
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text',
            maxwidth = 50,
            ellipsis_char = '...',
            show_labelDetails = true,
        })
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end
    }
})

cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' },
        { name = 'cmdline' }
    })
})

-- Snippets
luasnip.setup()
require("luasnip.loaders.from_vscode").lazy_load()
