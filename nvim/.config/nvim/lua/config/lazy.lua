local lazy = require("lazy")

lazy.setup({
    -- plugins
    {
        "neovim/nvim-lspconfig",
        config = function() require("config.plugins.lsp.servers") end,
        ft = lsp_languages,
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-path",
            "lukas-reineke/cmp-rg",
            {
                "L3MON4D3/LuaSnip",
                config = function() require("luasnip.loaders.from_vscode").lazy_load() end
            },
            "saadparwaiz1/cmp_luasnip",
        },
        config = function() require("config.plugins.lsp.completion") end,
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function() require("config.plugins.telescope") end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        ft = treesitter_languages,
        dependencies = {
            "nvim-treesitter/nvim-treesitter-context", -- life saver
            "nvim-treesitter/nvim-treesitter-textobjects"
        },
        config = function() require("config.plugins.treesitter") end,
    },
    {
        "j-hui/fidget.nvim",
        config = function() require("config.plugins.fidget") end,
        ft = lsp_languages,
    },
    {
        "ellisonleao/glow.nvim",
        branch = "main", -- cucked
        ft = "markdown",
    },
    {
        "numToStr/Comment.nvim",
        config = function() require("config.plugins.comment") end,
    },
    {
        "nvim-lualine/lualine.nvim",
        config = function() require("config.plugins.lualine") end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function() require("config.plugins.indent-blankline") end,
    },
    {
        "windwp/nvim-autopairs",
        config = function() require("config.plugins.autopairs") end,
    },
    { "rcarriga/nvim-notify" },
    {
        "kylechui/nvim-surround",
        config = function() require("nvim-surround").setup {} end
    },
    {
        "folke/which-key.nvim",
        config = function() require('config.plugins.which-key') end,
    },

    {
        "echasnovski/mini.nvim",
        config = function() require('mini.indentscope').setup() end,
    },
    {
        "akinsho/toggleterm.nvim",
        config = function() require("config.plugins.toggleterm") end
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function() require('config.plugins.gitsigns') end,
    },
    { "NvChad/nvim-colorizer.lua" },
    { "tpope/vim-fugitive" },
},
{
    rtp = {
        disabled_plugins = {
            "gzip",
            "matchit",
            "matchparen",
            "netrwPlugin",
            "tarPlugin",
            "tohtml",
            "tutor",
            "zipPlugin",
        },
    },
    ui = {
        icons = {
            lazy = ""
        },
    },
    checker = {
        enabled = true
    },
})
