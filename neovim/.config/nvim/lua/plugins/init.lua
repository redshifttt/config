return {
    {
        'L3MON4D3/LuaSnip'
    },
    {
        'lewis6991/gitsigns.nvim',
        config = true
    },
    {
        "j-hui/fidget.nvim",
        config = true
    },
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = true
    },
    {
        "tpope/vim-fugitive"
    },
    {
        "bluz71/vim-moonfly-colors",
        name = "moonfly",
        lazy = false,
        priority = 1000,
        config = function ()
            vim.g.moonflyWinSeparator = 2
            vim.g.moonflyTerminalColors = false

            vim.cmd("colorscheme moonfly")

            vim.api.nvim_set_hl(0, "StatusLine", { bg = "#080808" })
            vim.api.nvim_set_hl(0, "Winbar", { bg = "#080808" })
            vim.api.nvim_set_hl(0, "WinbarNC", { bg = "#080808" })
        end
    },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",         -- required
            -- "sindrets/diffview.nvim",        -- optional - Diff integration
        },
        config = true
    }
}
