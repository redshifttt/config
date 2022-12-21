-- General Keybinds (no plugins)
local keymap = vim.keymap

local opts = {
    noremap = true
}

-- Splits
keymap.set("n", "<C-J>", "<C-W><C-J>", opts)
keymap.set("n", "<C-K>", "<C-W><C-K>", opts)
keymap.set("n", "<C-L>", "<C-W><C-L>", opts)
keymap.set("n", "<C-H>", "<C-W><C-H>", opts)

-- Arrow keys
keymap.set({"n", "i", "v"}, "<Up>", "<Nop>", opts)
keymap.set({"n", "i", "v"}, "<Down>", "<Nop>", opts)
keymap.set({"n", "i", "v"}, "<Left>", "<Nop>", opts)
keymap.set({"n", "i", "v"}, "<Right>", "<Nop>", opts)

-- Quickly open my init.vim then let me reload the config
keymap.set("n", "<leader>v", "<cmd>vs $MYVIMRC<cr>", opts)
keymap.set("n", "<F5>", "<cmd>source $MYVIMRC<cr>", opts)

-- Center the found search term
keymap.set("n", "n", "nzz", opts)
keymap.set("n", "N", "Nzz", opts)

-- Similar as the above but for motion keys
keymap.set("n", "<ctrl-d>", "<ctrl-d>zz", opts)
keymap.set("n", "<ctrl-u>", "<ctrl-u>zz", opts)

-- I don't like accidentally hitting these
keymap.set("n", "H", "<cmd>nohlsearch<cr>", opts)
keymap.set("n", "L", "<Nop>", opts)

keymap.set('n', 'gx', '<Cmd>call jobstart(["xdg-open", expand("<cfile>")], {"detach": v:true})<CR>')
