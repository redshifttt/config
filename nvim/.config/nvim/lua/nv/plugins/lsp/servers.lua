local lsp = require('lspconfig')
local telescope = require("telescope.builtin")

-- I got this from theprimeagen and it's fucking magic
local function config(server_setup)
    return vim.tbl_deep_extend("force", {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        flags = { debounce_text_changes = 150 },
        on_attach = function()
            local bufopts = {
                noremap = true,
                silent = true,
                buffer = 0,
            }

            vim.keymap.set('n', 'gd', function() telescope.lsp_definitions() end, bufopts)
            vim.keymap.set('n', 'gR', function() telescope.lsp_references() end, bufopts)
            vim.keymap.set('n', 'gD', function() telescope.lsp_type_definitions() end, bufopts)

            vim.keymap.set('n', '<leader>e', function() vim.diagnostic.open_float() end, bufopts)
            vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev() end, bufopts)
            vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next() end, bufopts)
            vim.keymap.set('n', '<leader>q', function() vim.diagnostic.setloclist() end, bufopts)
            vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, bufopts)
            vim.keymap.set('n', 'gK', function() vim.lsp.buf.hover() end, bufopts)
            vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end, bufopts)
            vim.keymap.set('n', 'g<C-k>', function() vim.lsp.buf.signature_help() end, bufopts)
            -- vim.keymap.set('n', 'gwa', function() vim.lsp.buf.add_workspace_folder() end, bufopts)
            -- vim.keymap.set('n', 'gwr', function() vim.lsp.buf.remove_workspace_folder() end, bufopts)
            vim.keymap.set('n', 'gwl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, bufopts)
            vim.keymap.set('n', 'gr', function() vim.lsp.buf.rename() end, bufopts)
            vim.keymap.set('n', 'ca', function() vim.lsp.buf.code_action() end, bufopts)
            -- Not every server supports formatting IIRC
            -- vim.keymap.set('n', 'gf', function() vim.lsp.buf.formatting() end, bufopts)
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
