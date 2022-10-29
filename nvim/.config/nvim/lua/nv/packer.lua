local packer = require("packer")
local util = require("packer.util")

local use = packer.use
local init = packer.init

init {
    package_root = util.join_paths(vim.fn.stdpath('config'), 'pack')
}

packer.reset()

use {
    'wbthomason/packer.nvim',
}

if packer_bootstrap then
	packer.sync()
end

use 'lewis6991/impatient.nvim'

use {
    'neovim/nvim-lspconfig',
    config = function()
        require("nv.plugins.lsp.config")
    end,
}

use {
    'hrsh7th/nvim-cmp',
    requires = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-path',
        'lukas-reineke/cmp-rg',
        {
            'L3MON4D3/LuaSnip',
            config = function()
                require("luasnip.loaders.from_vscode").lazy_load()
            end
        },
        'saadparwaiz1/cmp_luasnip',
    },
}

use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
        require("nv.plugins.telescope")
    end,
}

use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    requires = { 'nvim-treesitter/playground' },
    config = function()
        require("nv.plugins.treesitter")
    end,
}

use {
    "ellisonleao/glow.nvim",
    branch = 'main', -- cucked
    ft = "markdown",
}

use {
    'numToStr/Comment.nvim',
    config = function()
        require("nv.plugins.comment")
    end,
}

use 'dstein64/vim-startuptime'

use {
    'nvim-lualine/lualine.nvim',
    requires = {
        {
            'kyazdani42/nvim-web-devicons',
            opt = true
        },
        'arkav/lualine-lsp-progress'
    },
    config = function()
        require("nv.plugins.lualine")
    end,
}

use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
        require("nv.plugins.indent-blankline")
    end,
}

use {
    'AndrewRadev/splitjoin.vim',
}

use {
    "windwp/nvim-autopairs",
    config = function()
        require("nv.plugins.autopairs")
    end,
}

use {'rcarriga/nvim-notify'}
