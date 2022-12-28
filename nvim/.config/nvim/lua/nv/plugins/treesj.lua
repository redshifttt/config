local map = vim.keymap.set
local treesj = require("treesj") -- TODO: move eventually

treesj.setup()

local opts = {
    noremap = true
}

map("n", "gj", function() treesj.join() end, opts) -- TODO: move eventually
map("n", "gs", function() treesj.split() end, opts) -- TODO: move eventually
