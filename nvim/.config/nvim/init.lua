-- Neovim Config

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--single-branch",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.runtimepath:prepend(lazypath)

vim.cmd.colorscheme("tonight")

-- This needs to get set before lazy for it to use the leader key you have set
-- instead of default \ key
vim.g.mapleader = " "

lsp_languages = {"c", "python", "lua"}
treesitter_languages = {"bash", "lua", "python", "html", "css", "vim", "markdown", "c"}

require("config.lazy")
require("config.set")
require("config.autocmd")
require("config.keys")

vim.notify = require("notify")
