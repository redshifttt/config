local lsp = require('lspconfig')

-- I got this from theprimeagen and it's fucking magic
local function config(server_setup)
    return vim.tbl_deep_extend("force", {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        flags = { debounce_text_changes = 150 },
        on_attach = function()
            vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, { desc = "LSP definitions" })
            vim.keymap.set('n', 'gR', function() vim.lsp.buf.references() end, { desc = "LSP references" })
            vim.keymap.set('n', 'gD', function() vim.lsp.buf.type_definition() end, { desc = "LSP type definitions" })

            vim.keymap.set('n', '<leader>e', function() vim.diagnostic.open_float() end, { desc = "" })
            vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev() end, { desc = "LSP previous diagnostic" })
            vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next() end, { desc = "LSP next diagnostic" })
            vim.keymap.set('n', '<leader>q', function() vim.diagnostic.setloclist() end, { desc = "" })
            vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, { desc = "LSP declarations" })
            vim.keymap.set('n', 'gK', function() vim.lsp.buf.hover() end, { desc = "LSP hover text" })
            vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end, { desc = "LSP jump to implementation" })
            vim.keymap.set('n', 'g<C-k>', function() vim.lsp.buf.signature_help() end, { desc = "" })
            -- vim.keymap.set('n', 'gwa', function() vim.lsp.buf.add_workspace_folder() end, { desc = "" })
            -- vim.keymap.set('n', 'gwr', function() vim.lsp.buf.remove_workspace_folder() end, { desc = "" })
            vim.keymap.set('n', 'gwl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, { desc = "" })
            vim.keymap.set('n', 'gr', function() vim.lsp.buf.rename() end, { desc = "LSP rename" })
            -- vim.keymap.set('n', 'ca', function() vim.lsp.buf.code_action() end, { desc = "LSP code action" })
        end,
    }, server_setup or {})
end

-- Lua
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lsp.sumneko_lua.setup(config({
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
                -- Setup your lua path
                path = runtime_path,
            },
            diagnostics = { -- Get the language server to recognize the `vim` global
                globals = { "vim" },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                useGitIgnore = true,
                checkThirdParty = false,
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = { enable = false },
            hint = { enable = true }
        },
    },
}))

-- C
lsp.clangd.setup(config({
    cmd = { "clangd" },
    filetypes = { "c", "cpp", "h" },
}))

-- Python
lsp.pylsp.setup(config({
    filetypes = { "python" },
    settings = {
        pylsp = {
            configurationSources = { "pylint" },
            plugins = {
                pylint = {
                    enabled = true,
                    executable = "pylint",
                },
                flake8 = { enabled = false },
                pyflakes = { enabled = false },
            }
        }
    }
}))
