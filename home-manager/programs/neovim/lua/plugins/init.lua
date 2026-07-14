require("plugins.completion")
require("plugins.lsp")
require("plugins.mini")
require("plugins.notify")
require("plugins.oil")
require("plugins.telescope")
require("plugins.treesitter")

require('nvim-highlight-colors').setup()

require('gitsigns').setup()

require("noice").setup({
    cmdline = {
        format = {
            lua = false
        }
    }
})

require("nvim-surround").setup()

vim.g.moonflyWinSeparator = 2
vim.g.moonflyTerminalColors = false

vim.cmd("colorscheme moonfly")

vim.api.nvim_set_hl(0, "StatusLine", { bg = "#080808" })
vim.api.nvim_set_hl(0, "Winbar", { bg = "#080808" })
vim.api.nvim_set_hl(0, "WinbarNC", { bg = "#080808" })
