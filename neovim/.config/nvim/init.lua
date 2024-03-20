require("set")
require("keys")
require("autocmd")
require("plugins")

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

require('Comment').setup()
