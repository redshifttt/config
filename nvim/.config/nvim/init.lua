-- Neovim Config

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

require("impatient")

require("nv.plugin_manager")
require("nv.set")
require("nv.autocmd")
require("nv.keys")

vim.notify = require("notify")

vim.cmd.colorscheme("tonight")
