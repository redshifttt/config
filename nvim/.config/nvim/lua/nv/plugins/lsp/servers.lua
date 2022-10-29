local lsp = require('lspconfig')

-- Lua
local sumneko_binary_path = vim.fn.exepath('lua-language-server')
local sumneko_root_path = vim.fn.fnamemodify(sumneko_binary_path, ':h:h:h')

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lsp.sumneko_lua.setup(config({
    filetypes = { "lua" },
    cmd = {
        sumneko_binary_path,
        "-E",
        sumneko_root_path .. "/main.lua",
    };
    -- root_dir = vim.lsp.util.root_pattern('init.lua', 'README.md'),
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
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = { enable = false },
            hint = {
                enable = true
            }
        },
    },
}))

-- C
lsp.clangd.setup(config({
    cmd = { "clangd" },
    filetypes = {
        "c",
        "cpp",
        "h",
    },
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
