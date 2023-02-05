local toggleterm = require("toggleterm")
local keymap = require("vim.keymap")

toggleterm.setup {
    shade_terminals = false,
}

keymap.set("n", "<leader>t", "<cmd>ToggleTerm<cr>")
