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

-- I don't like accidentally hitting these
map("n", "H", "<Nop>", opts)
map("n", "L", "<Nop>", opts)

map('n', 'gx', '<Cmd>call jobstart(["xdg-open", expand("<cfile>")], {"detach": v:true})<CR>')
