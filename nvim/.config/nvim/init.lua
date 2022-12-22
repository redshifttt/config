-- Neovim Config

local lazypath = vim.fn.stdpath("config") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({ "git", "clone", "--filter=blob:none", "--single-branch", "https://github.com/folke/lazy.nvim.git", lazypath })
end
vim.opt.runtimepath:prepend(lazypath)

require("nv.plugin_manager")
require("nv.set")
require("nv.autocmd")
require("nv.keys")

vim.notify = require("notify")

vim.cmd.colorscheme("tonight")
