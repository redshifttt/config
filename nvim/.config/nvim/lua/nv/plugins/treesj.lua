local treesj = require("treesj")

treesj.setup()

vim.keymap.map("n", "gj", function() treesj.join() end, { desc = "Join splitted text" })
vim.keymap.map("n", "gs", function() treesj.split() end, { desc = "Split joined text" })
