-- If this is executed and an error is thrown packer is not installed.
local packer_is_installed = function() require('impatient') end

if not pcall(packer_is_installed) then
    local fn = vim.fn
    local install_path = fn.stdpath('config')..'/pack/packer/start/packer.nvim'

    if fn.empty(fn.glob(install_path)) > 0 then
        vim.cmd("!git clone --depth 1 https://github.com/wbthomason/packer.nvim " .. install_path)
        vim.cmd.packadd("packer.nvim")
    end
end

require("nv.set")
require("nv.autocmd")
require("nv.keys")
require("nv.packer")

vim.notify = require("notify")

vim.cmd.colorscheme("tonight")
