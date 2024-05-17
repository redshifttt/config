return {
    {
        "Shatur/neovim-ayu",
        config = function()
            -- require('ayu').colorscheme()
        end
    },
    { 'L3MON4D3/LuaSnip' },
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
        'numToStr/Comment.nvim',
        lazy = false,
        config = true
    },
    { "tpope/vim-fugitive" },
    {
        "bluz71/vim-moonfly-colors",
        name = "moonfly",
        lazy = false,
        priority = 1000,
        config = function ()
            vim.cmd("colorscheme moonfly")
        end
    },
}
