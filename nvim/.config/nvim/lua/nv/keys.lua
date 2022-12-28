-- General Keybinds (no plugins)
local keymap = vim.keymap

-- Splits
keymap.set("n", "<C-J>", "<C-W><C-J>")
keymap.set("n", "<C-K>", "<C-W><C-K>")
keymap.set("n", "<C-L>", "<C-W><C-L>")
keymap.set("n", "<C-H>", "<C-W><C-H>")

-- Arrow keys
keymap.set({"n", "i", "v"}, "<Up>", "<Nop>")
keymap.set({"n", "i", "v"}, "<Down>", "<Nop>")
keymap.set({"n", "i", "v"}, "<Left>", "<Nop>")
keymap.set({"n", "i", "v"}, "<Right>", "<Nop>")

-- Quickly open my init.vim then let me reload the config
keymap.set("n", "<leader>v", "<cmd>vs $MYVIMRC<cr>")
keymap.set("n", "<F5>", "<cmd>source $MYVIMRC<cr>")

-- Center the found search term
keymap.set("n", "n", "nzz")
keymap.set("n", "N", "Nzz")

-- Similar as the above but for motion keys
keymap.set("n", "<ctrl-d>", "<ctrl-d>zz")
keymap.set("n", "<ctrl-u>", "<ctrl-u>zz")

-- I don't like accidentally hitting these
keymap.set("n", "H", "<cmd>nohlsearch<cr>")
keymap.set("n", "L", "<nop>")

-- Never really use this rn
-- keymap.set('n', 'gx', '<cmd>call jobstart(["xdg-open", expand("<cfile>")], {"detach": v:true})<cr>')

-- Open a terminal
-- Found a cool plugin that does this and more
-- keymap.set('n', '<leader>t', '<cmd>vs term://bash<CR>')
