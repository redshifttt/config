-- General Keybinds (no plugins)
local keymap = vim.keymap

-- Splits
keymap.set("n", "<C-J>", "<C-W><C-J>", { desc = "Move to split below" })
keymap.set("n", "<C-K>", "<C-W><C-K>", { desc = "Move to split above" })
keymap.set("n", "<C-L>", "<C-W><C-L>", { desc = "Move to split right" })
keymap.set("n", "<C-H>", "<C-W><C-H>", { desc = "Move to split left" })

-- Arrow keys
keymap.set({"n", "i", "v"}, "<Up>", "<Nop>")
keymap.set({"n", "i", "v"}, "<Down>", "<Nop>")
keymap.set({"n", "i", "v"}, "<Left>", "<Nop>")
keymap.set({"n", "i", "v"}, "<Right>", "<Nop>")

-- Quickly open my init.vim then let me reload the config
keymap.set("n", "<F5>", "<cmd>source $MYVIMRC<cr>", { desc = "Reload whole config" })

-- Center the found search term
keymap.set("n", "n", "nzz", { desc = "Next found search" })
keymap.set("n", "N", "Nzz", { desc = "Last found search" })

-- Similar as the above but for motion keys
keymap.set("n", "<ctrl-d>", "<ctrl-d>zz", { desc = "Jump down" })
keymap.set("n", "<ctrl-u>", "<ctrl-u>zz", { desc = "Jump up" })

-- I don't like accidentally hitting these
keymap.set("n", "H", "<nop>")
keymap.set("n", "L", "<nop>")

keymap.set("n", "<leader>gs", "<cmd>Git<cr>")

keymap.set("n", "<esc>", "<cmd>nohl<cr>")
