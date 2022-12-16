-- General Keybinds (no plugins)
local treesj = require("treesj") -- TODO: move eventually
local map = vim.keymap.set

local opts = {
    noremap = true
}

-- Splits
map("n", "<C-J>", "<C-W><C-J>", opts)
map("n", "<C-K>", "<C-W><C-K>", opts)
map("n", "<C-L>", "<C-W><C-L>", opts)
map("n", "<C-H>", "<C-W><C-H>", opts)

-- Arrow keys
map({"n", "i", "v"}, "<Up>", "<Nop>", opts)
map({"n", "i", "v"}, "<Down>", "<Nop>", opts)
map({"n", "i", "v"}, "<Left>", "<Nop>", opts)
map({"n", "i", "v"}, "<Right>", "<Nop>", opts)

-- Quickly open my init.vim then let me reload the config
map("n", "<leader>v", ":vs $MYVIMRC<cr>", opts)
map("n", "<F5>", ":source $MYVIMRC<cr>", opts)

-- Center the found search term
map("n", "n", "nzz", opts)
map("n", "N", "Nzz", opts)

-- Similar as the above but for motion keys
map("n", "<ctrl-d>", "<ctrl-d>zz", opts)
map("n", "<ctrl-u>", "<ctrl-u>zz", opts)

-- I don't like accidentally hitting these
map("n", "H", ":nohlsearch<cr>", opts)
map("n", "L", "<Nop>", opts)

map('n', 'gx', '<Cmd>call jobstart(["xdg-open", expand("<cfile>")], {"detach": v:true})<CR>')

map("n", "gj", function() treesj.join() end, opts) -- TODO: move eventually
map("n", "gs", function() treesj.split() end, opts) -- TODO: move eventually
