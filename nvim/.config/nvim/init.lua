-- ======
-- = nv =
-- ======

-- local bootstrap = function()
--     local fn = vim.fn
--     local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
--     if fn.empty(fn.glob(install_path)) > 0 then
--         vim.cmd("!git clone --depth 1 https://github.com/wbthomason/packer.nvim " .. install_path)
--         vim.cmd.packadd("packer.nvim")
--         return true
--     end
--     return false
-- end

-- local bootstrapped = bootstrap()

-- if bootstrapped then
require('impatient')
-- end

require("nv.set")
require("nv.autocmd")
require("nv.keys")
require("nv.packer")

vim.notify = require("notify")

vim.cmd.colorscheme("tonight")
