local treesitter = require('nvim-treesitter.configs')

treesitter.setup {
    ensure_installed = {
        "bash",
        "c",
        "cpp",
        "lua",
        "python",
        "html",
        "css",
        "vim",
        "markdown",
        "go",
    },
    sync_install = true, -- Install languages synchronously (only applied to `ensure_installed`)
    ignore_install = {}, -- List of parsers to ignore installing
    highlight = {
        enable = true, -- `false` will disable the whole extension
        disable = {}, -- list of language that will be disabled
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
    },
    playground = {
        enable = true,
        disable = {},
        updatetime = 10, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
            toggle_query_editor = 'o',
            toggle_hl_groups = 'i',
            toggle_injected_languages = 't',
            toggle_anonymous_nodes = 'a',
            toggle_language_display = 'I',
            focus_language = 'f',
            unfocus_language = 'F',
            update = 'R',
            goto_node = '<cr>',
            show_help = '?',
        },
    }
}
