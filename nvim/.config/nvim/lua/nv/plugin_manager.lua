local lazy = require("lazy")

lazy.setup({
    -- Plugins
    {
        "neovim/nvim-lspconfig",
        config = function() require("nv.plugins.lsp.servers") end,
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
        config = function() require("nv.plugins.lsp.completion") end,
        lazy = true,
    },

    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function() require("nv.plugins.telescope") end,
        lazy = true,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = {
            "nvim-treesitter/playground",
            "nvim-treesitter/nvim-treesitter-context" -- life saver
        },
        config = function() require("nv.plugins.treesitter") end,
    },

    {
        "j-hui/fidget.nvim",
        config = function() require("nv.plugins.fidget") end,
    },

    {
        "ellisonleao/glow.nvim",
        branch = "main", -- cucked
        ft = "markdown",
    },

    {
        "numToStr/Comment.nvim",
        config = function() require("nv.plugins.comment") end,
    },

    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            { "kyazdani42/nvim-web-devicons", lazy = true }
        },
        config = function() require("nv.plugins.lualine") end,
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        config = function() require("nv.plugins.indent-blankline") end,
    },

    {
        "windwp/nvim-autopairs",
        config = function() require("nv.plugins.autopairs") end,
    },

    { "rcarriga/nvim-notify" },

    {
        "kylechui/nvim-surround",
        config = function() require("nvim-surround").setup {} end
    },

    {
        "Wansmer/treesj",
        config = function() require('nv.plugins.treesj') end,
        lazy = true
    },

    {
        "folke/which-key.nvim",
        config = function() require("which-key").setup {} end,
    },

    {
        "echasnovski/mini.nvim",
        config = function() require('mini.indentscope').setup() end,
    },
},
{ -- opts
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
})
