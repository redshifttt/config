-- Stuff that doesn't need their own files.

vim.loader.enable()

vim.notify = require("notify")

require("notify").setup({
    icons = {
        DEBUG = "[DEBUG]",
        ERROR = "[ERROR]",
        INFO = "[INFO]",
        TRACE = "[TRACE]",
        WARN = "[WARN]"
    },
    stages = "static",
    render = "compact",
})

require("oil").setup()
vim.keymap.set("n", "<leader>o", function() require("oil").open() end)

require("gitsigns").setup()
require("fidget").setup()
require("nvim-surround").setup()

-- indent-blankline
require("ibl").setup({
    indent = {
        char = "▏"
    },
    exclude = {
        filetypes = { 'glowpreview' }
    }
})

-- :source $VIMRUNTIME/syntax/hitest.vim
require('ayu').setup({
    overrides = {
        CursorLine = { bg = "#111111" },
        VertSplit = { fg = "#050505" },
        TabLineSel = { bg = "#050505" },
        NormalBorder = { fg = "#050505" },

        Normal = { bg = "None" },
        NormalFloat = { bg = "None" },
        ColorColumn = { bg = "None" },
        SignColumn = { bg = "None" },
        Folded = { bg = "None" },
        FoldColumn = { bg = "None" },
        CursorLineNr = { bg = "None" },
        CursorColumn = { bg = "None" },
        WhichKeyFloat = { bg = "None" },
        StatusLine = { bg = "None" },
        TabLine = { bg = "None" },

        MiniCursorword = { bg = "#151515", underline = true },
        MiniCursorwordCurrent = { bg = "#111111" },
        NotifyBackground = { bg = "#111111" },
    },
})

require('Comment').setup()

vim.cmd.colorscheme("ayu-dark")
