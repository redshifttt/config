local lsp = require('lspconfig')
local cmp = require('cmp')

-- I got this from theprimeagen and it's fucking magic
function config(_config)
    return vim.tbl_deep_extend("force", {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        flags = { debounce_text_changes = 150 },
        on_attach = function()
            local bufopts = {
                noremap = true,
                silent = true,
                buffer = 0,
            }

            vim.keymap.set('n', '<leader>e', function() vim.diagnostic.open_float() end, bufopts)
            vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev() end, bufopts)
            vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next() end, bufopts)
            vim.keymap.set('n', '<leader>q', function() vim.diagnostic.setloclist() end, bufopts)

            vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, bufopts)
            vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, bufopts)
            vim.keymap.set('n', 'gK', function() vim.lsp.buf.hover() end, bufopts)
            vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end, bufopts)
            vim.keymap.set('n', 'g<C-k>', function() vim.lsp.buf.signature_help() end, bufopts)
            vim.keymap.set('n', 'gwa', function() vim.lsp.buf.add_workspace_folder() end, bufopts)
            vim.keymap.set('n', 'gwr', function() vim.lsp.buf.remove_workspace_folder() end, bufopts)
            vim.keymap.set('n', 'gwl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, bufopts)
            vim.keymap.set('n', 'gD', function() vim.lsp.buf.type_definition() end, bufopts)
            vim.keymap.set('n', 'gr', function() vim.lsp.buf.rename() end, bufopts)
            vim.keymap.set('n', 'ca', function() vim.lsp.buf.code_action() end, bufopts)
            vim.keymap.set('n', 'gR', function() vim.lsp.buf.references() end, bufopts)
            -- Not every server supports formatting IIRC
            -- vim.keymap.set('n', 'gf', function() vim.lsp.buf.formatting() end, bufopts)
        end,
    }, _config or {})
end

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
        ["<C-b>"] = function(fallback)
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

require("nv.plugins.lsp.servers")
