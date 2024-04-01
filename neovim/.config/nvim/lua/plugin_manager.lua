local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x'
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("plugins.lsp")
        end
    },
    { 'hrsh7th/cmp-nvim-lsp' },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline'
        }
    },
    { 'L3MON4D3/LuaSnip' },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function ()
            require("plugins.treesitter")
        end
    },
    {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require("plugins.telescope")
        end
    },
    {
        "Shatur/neovim-ayu",
        config = function()
            require('ayu').colorscheme()
        end
    },
    {
        'echasnovski/mini.nvim',
        version = '*',
        config = function()
            require("plugins.mini")
        end
    },
    {
        'rcarriga/nvim-notify',
        config = function()
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
        end
    },
    {
        'stevearc/oil.nvim',
        config = function()
            require("oil").setup()
            vim.keymap.set("n", "<leader>o", function() require("oil").open() end)
        end
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
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("ibl").setup({
                indent = { char = "▏" },
                exclude = { filetypes = { 'glowpreview' } }
            })
            vim.api.nvim_set_hl(0, "IblIndent", { fg = "#222222" })
        end
    },
    {
        'numToStr/Comment.nvim',
        lazy = false,
        config = true
    },
    { "tpope/vim-fugitive" },
}

require("lazy").setup(plugins, opts)
