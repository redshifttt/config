-- General Keybinds (no plugins)

-- Splits
vim.keymap.set("n", "<C-J>", "<C-W><C-J>")
vim.keymap.set("n", "<C-K>", "<C-W><C-K>")
vim.keymap.set("n", "<C-L>", "<C-W><C-L>")
vim.keymap.set("n", "<C-H>", "<C-W><C-H>")

-- Arrow keys
vim.keymap.set({"n", "i", "v"}, "<Up>", "<Nop>")
vim.keymap.set({"n", "i", "v"}, "<Down>", "<Nop>")
vim.keymap.set({"n", "i", "v"}, "<Left>", "<Nop>")
vim.keymap.set({"n", "i", "v"}, "<Right>", "<Nop>")

-- Center the found search term
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- Similar as the above but for motion keys
vim.keymap.set("n", "<ctrl-d>", "<ctrl-d>zz")
vim.keymap.set("n", "<ctrl-u>", "<ctrl-u>zz")

vim.keymap.set("n", "<leader>gs", "<cmd>Git<cr>")

vim.keymap.set("n", "<esc>", "<cmd>nohl<cr>")
